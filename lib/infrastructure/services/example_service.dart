import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../domain/interfaces/services/example_service_interface.dart';

class ExampleService extends GetxService implements IExampleService {
  @override
  Future<ExampleService> init() async {
    // Initialize your service here
    return this;
  }

  @override
  void doSomething() {
    debugPrint("ExampleService is doing something!");
  }
}
