import 'package:sqflite_sqlcipher/sqflite.dart';

abstract class IDbProvider {
  Future<IDbProvider> init();
  Future<Database> get database;
  Future<void> close();
  Future<void> deleteDb();
}
