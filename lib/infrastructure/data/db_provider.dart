import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:path/path.dart' as path;
import 'providers/i_db_provider.dart';

class DbProvider extends GetxService implements IDbProvider {
  static const _dbName = 'app_database.db';
  static const _dbVersion = 1;

  Database? _db;
  Completer<Database>? _openingCompleter;

  @override
  Future<DbProvider> init() async {
    await database;
    return this;
  }

  @override
  Future<Database> get database async {
    final existing = _db;
    if (existing != null) return existing;

    final opening = _openingCompleter;
    if (opening != null) return opening.future;

    _openingCompleter = Completer<Database>();
    try {
      final db = await _openDb();
      _db = db;
      _openingCompleter!.complete(db);
      return db;
    } catch (e, st) {
      _openingCompleter!.completeError(e, st);
      rethrow;
    } finally {
      _openingCompleter = null;
    }
  }

  Future<Database> _openDb() async {
    final dbDir = await getDatabasesPath();
    final dbPath = path.join(dbDir, _dbName);

    var passphrase = await _getPassKeyAsync();
    final escapedKey = passphrase.replaceAll("'", "''");

    try {
      return openDatabase(
        dbPath,
        version: _dbVersion,
        password: escapedKey,
        onConfigure: (db) async {
          await db.execute('PRAGMA foreign_keys = ON');
        },
        onCreate: (db, version) async {
          await _createSchema(db);
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          await _migrate(db, oldVersion, newVersion);
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> close() async {
    final db = _db;
    _db = null;
    if (db != null) {
      await db.close();
    }
  }

  @override
  Future<void> deleteDb() async {
    final dbDir = await getDatabasesPath();
    final dbPath = path.join(dbDir, _dbName);
    await close();
    await deleteDatabase(dbPath);
  }

  Future<void> _createSchema(Database db) async {
    // Example table creation
    await db.execute('''
      CREATE TABLE ExampleModels(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        createdAt TEXT
      )
    ''');
  }

  Future<void> _migrate(Database db, int oldVersion, int newVersion) async {}

  Future<String> _getPassKeyAsync() async {
    final secureStorage = FlutterSecureStorage();
    const passphraseKey = 'dbPassphrase';

    String? passphrase = await secureStorage.read(key: passphraseKey);
    if (passphrase == null) {
      passphrase = _generatePassphrase();
      await secureStorage.write(key: passphraseKey, value: passphrase);
    }

    return passphrase;
  }

  String _generatePassphrase() {
    final random = Random.secure();
    final key = List<int>.generate(32, (_) => random.nextInt(256));
    return base64Url.encode(key);
  }
}
