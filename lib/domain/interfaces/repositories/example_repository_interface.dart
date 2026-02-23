import '../models/example_model.dart';

abstract class IExampleRepository {
  Future<ExampleModel> save(ExampleModel item);
  Future<List<ExampleModel>> getAll();
  Future<int> update(ExampleModel item);
  Future<int> delete(int id);
}
