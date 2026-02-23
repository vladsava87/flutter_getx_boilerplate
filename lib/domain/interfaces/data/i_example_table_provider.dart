import '../../../infrastructure/data/models/example_entity.dart';

abstract class IExampleTableProvider {
  Future<int> insert(ExampleEntity entity);
  Future<List<ExampleEntity>> getAll();
  Future<int> update(ExampleEntity entity);
  Future<int> delete(int id);
}
