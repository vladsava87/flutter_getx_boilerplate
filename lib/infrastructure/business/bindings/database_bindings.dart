import 'package:get/get.dart';
import '../../data/db_provider.dart';
import '../../data/providers/example_table_provider.dart';
import '../../data/repositories/example_repository.dart';
import '../../data/providers/i_db_provider.dart';
import '../../data/providers/i_example_table_provider.dart';
import '../../../../domain/repositories/i_example_repository.dart';

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
