import 'package:get/get.dart';
import '../../infrastructure/data/db_provider.dart';
import '../../infrastructure/data/providers/example_table_provider.dart';
import '../../infrastructure/data/repositories/example_repository.dart';
import '../../domain/interfaces/data/i_db_provider.dart';
import '../../domain/interfaces/data/i_example_table_provider.dart';
import '../../domain/interfaces/data/i_example_repository.dart';

class DatabaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IDbProvider>(() => DbProvider(), fenix: true);
    Get.lazyPut<IExampleTableProvider>(
      () => ExampleTableProvider(Get.find<IDbProvider>()),
      fenix: true,
    );
    Get.lazyPut<IExampleRepository>(
      () => ExampleRepository(Get.find<IExampleTableProvider>()),
      fenix: true,
    );
  }
}
