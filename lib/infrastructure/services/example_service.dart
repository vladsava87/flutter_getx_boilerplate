import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ExampleService extends GetxService {
  Future<ExampleService> init() async {
    // Initialize your service here
    return this;
  }

  void doSomething() {
    debugPrint("ExampleService is doing something!");
  }
}
