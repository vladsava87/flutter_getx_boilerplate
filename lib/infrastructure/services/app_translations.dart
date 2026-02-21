import 'package:get/get.dart';

class AppTranslations extends Translations {
  final Map<String, Map<String, String>> translationMap;

  AppTranslations(this.translationMap);

  @override
  Map<String, Map<String, String>> get keys => translationMap;
}
