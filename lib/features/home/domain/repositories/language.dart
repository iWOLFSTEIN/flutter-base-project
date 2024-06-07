import 'package:flutter_base_project/config/languages/language.dart';

abstract class LanguageRepo {
  Language getLanguage();
  Future<void> setLanguage({required Language language});
}
