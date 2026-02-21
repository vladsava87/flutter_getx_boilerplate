import '../../../../domain/models/example_model.dart';
import '../models/example_entity.dart';
import '../providers/example_table_provider.dart';

class ExampleRepository {
  final ExampleTableProvider _provider;

  ExampleRepository(this._provider);

  Future<ExampleModel> save(ExampleModel item) async {
    final entity = ExampleEntity(
      id: item.id,
      name: item.name,
      createdAt: item.createdAt,
    );
    final id = await _provider.insert(entity);
    return item.copyWith(id: id);
  }

  Future<List<ExampleModel>> getAll() async {
    final entities = await _provider.getAll();
    return entities
        .map(
          (entity) => ExampleModel(
            id: entity.id,
            name: entity.name,
            createdAt: entity.createdAt,
          ),
        )
        .toList();
  }

  Future<int> update(ExampleModel item) async {
    final entity = ExampleEntity(
      id: item.id,
      name: item.name,
      createdAt: item.createdAt,
    );
    return await _provider.update(entity);
  }

  Future<int> delete(int id) async {
    return await _provider.delete(id);
  }
}
