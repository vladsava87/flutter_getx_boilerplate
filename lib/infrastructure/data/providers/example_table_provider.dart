import 'package:sqflite_sqlcipher/sqflite.dart';
import 'i_db_provider.dart';
import 'i_example_table_provider.dart';
import '../models/example_entity.dart';

class ExampleTableProvider implements IExampleTableProvider {
  final IDbProvider dbProvider;

  ExampleTableProvider(this.dbProvider);

  static const String tableName = 'ExampleModels';

  @override
  Future<int> insert(ExampleEntity entity) async {
    final db = await dbProvider.database;
    return await db.insert(
      tableName,
      entity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<ExampleEntity>> getAll() async {
    final db = await dbProvider.database;
    final results = await db.query(tableName, orderBy: 'createdAt DESC');
    return results.map((e) => ExampleEntity.fromMap(e)).toList();
  }

  @override
  Future<int> update(ExampleEntity entity) async {
    final db = await dbProvider.database;
    return await db.update(
      tableName,
      entity.toMap(),
      where: 'id = ?',
      whereArgs: [entity.id],
    );
  }

  @override
  Future<int> delete(int id) async {
    final db = await dbProvider.database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
