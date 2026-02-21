import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../services/example_service.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleService>(() => ExampleService(), fenix: true);
    Get.put(HomeController(Get.find<ExampleService>()));
  }
}
