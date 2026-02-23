import 'package:get/get.dart';
import '../../../domain/interfaces/services/example_service_interface.dart';

class HomeController extends GetxController {
  final IExampleService _exampleService;

  HomeController(this._exampleService);

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _exampleService.doSomething();
  }

  void increment() {
    count.value++;
  }
}
