import 'package:get/get.dart';
import '../../data/db_provider.dart';
import '../../data/providers/example_table_provider.dart';
import '../../data/repositories/example_repository.dart';

class DatabaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DbProvider>(() => DbProvider(), fenix: true);
    Get.lazyPut<ExampleTableProvider>(
      () => ExampleTableProvider(Get.find<DbProvider>()),
      fenix: true,
    );
    Get.lazyPut<ExampleRepository>(
      () => ExampleRepository(Get.find<ExampleTableProvider>()),
      fenix: true,
    );
  }
}
