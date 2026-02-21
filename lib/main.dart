import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'infrastructure/constants/app_strings.dart';
import 'infrastructure/data/db_provider.dart';
import 'infrastructure/router.dart';
import 'infrastructure/services/app_translations.dart';
import 'infrastructure/services/example_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register synchronous global services
  await Get.putAsync(() => DbProvider().init());
  await Get.putAsync(() => ExampleService().init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (context) => AppStrings.appTitle.tr,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      translations: AppTranslations(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRouter.initial,
      getPages: AppRouter.routes,
    );
  }
}
