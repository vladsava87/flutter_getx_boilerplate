import 'package:get/get.dart';

import '../presentation/pages/home_page.dart';
import 'business/bindings/main_bindings.dart';

class AppRouter {
  static const String initial = '/';

  static final routes = [
    GetPage(
      name: initial,
      page: () => const HomePage(),
      binding: MainBindings(),
    ),
  ];
}
