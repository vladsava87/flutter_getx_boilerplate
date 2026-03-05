import 'package:get/get.dart';

import 'pages/home_page.dart';
import 'bindings/home_bindings.dart';

class AppRouter {
  static const String initial = '/';

  static final routes = [
    GetPage(
      name: initial,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
