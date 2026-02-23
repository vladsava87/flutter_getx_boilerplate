import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../services/example_service.dart';
import '../../../domain/interfaces/services/i_example_service.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IExampleService>(() => ExampleService(), fenix: true);
    Get.put(HomeController(Get.find<IExampleService>()));
  }
}
