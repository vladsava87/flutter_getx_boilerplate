import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'app_title': 'GetX Boilerplate',
      'welcome_message': 'Welcome to GetX Boilerplate',
      'increment_button': 'Increment',
    },
    'es_ES': {
      'app_title': 'GetX Plantilla',
      'welcome_message': 'Bienvenido a la plantilla GetX',
      'increment_button': 'Incrementar',
    },
  };
}
