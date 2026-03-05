import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../infrastructure/services/example_service.dart';
import '../../domain/interfaces/services/i_example_service.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IExampleService>(() => ExampleService(), fenix: true);
    Get.put(HomeController(Get.find<IExampleService>()));
  }
}
