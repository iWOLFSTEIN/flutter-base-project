import 'package:flutter_base_project/config/languages/language.dart';
import 'package:flutter_base_project/config/languages/language_config.dart';
import 'package:flutter_base_project/core/constants/app_constants.dart';

class Config {
  static const String fontFamily = 'Karla';
  static const String defaultTheme = AppConstants.light;
  static final Language defaultLanguage =
      LanguageConfig.defaultLanguage(AppConstants.english);
}
