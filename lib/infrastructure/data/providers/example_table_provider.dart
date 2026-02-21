import 'package:sqflite_sqlcipher/sqflite.dart';
import '../db_provider.dart';
import '../models/example_entity.dart';

class ExampleTableProvider {
  final DbProvider dbProvider;

  ExampleTableProvider(this.dbProvider);

  static const String tableName = 'ExampleModels';

  Future<int> insert(ExampleEntity entity) async {
    final db = await dbProvider.database;
    return await db.insert(
      tableName,
      entity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ExampleEntity>> getAll() async {
    final db = await dbProvider.database;
    final results = await db.query(tableName, orderBy: 'createdAt DESC');
    return results.map((e) => ExampleEntity.fromMap(e)).toList();
  }

  Future<int> update(ExampleEntity entity) async {
    final db = await dbProvider.database;
    return await db.update(
      tableName,
      entity.toMap(),
      where: 'id = ?',
      whereArgs: [entity.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await dbProvider.database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
