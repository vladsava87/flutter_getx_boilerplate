import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  final translations = await _loadJsonTranslations();

  runApp(MyApp(translations: translations));
}

Future<Map<String, Map<String, String>>> _loadJsonTranslations() async {
  final enJson = await rootBundle.loadString('assets/lang/en.json');
  final esJson = await rootBundle.loadString('assets/lang/es.json');

  return {
    'en_US': Map<String, String>.from(json.decode(enJson)),
    'es_ES': Map<String, String>.from(json.decode(esJson)),
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.translations});

  final Map<String, Map<String, String>> translations;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (context) => AppStrings.appTitle.tr,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      translations: AppTranslations(translations),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRouter.initial,
      getPages: AppRouter.routes,
    );
  }
}
