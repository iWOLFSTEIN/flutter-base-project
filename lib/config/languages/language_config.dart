import 'package:flutter/material.dart';
import 'package:flutter_base_project/config/languages/language.dart';
import 'package:flutter_base_project/core/constants/app_constants.dart';

/// To add a language in the app, add a translation in csv file placed in assets/translations
/// Then, add a key, local and label below.
/// Set a default language using defaultLanguage variable.
class LanguageConfig {
  // Keys
  static const List<String> _keys = [
    AppConstants.english,
    AppConstants.urdu,
    AppConstants.hindi
  ];

  // Locales
  static const Map<String, Locale> _locales = {
    AppConstants.english: Locale('en'),
    AppConstants.urdu: Locale('ur'),
    AppConstants.hindi: Locale('hi'),
  };

  // Labels
  static const Map<String, String> _labels = {
    AppConstants.english: "English",
    AppConstants.urdu: "اردو",
    AppConstants.hindi: "नहीं",
  };

  static Language defaultLanguage(key) =>
      Language(name: _labels[key]!, locale: _locales[key]!);

  static List<Language> get languages => _keys
      .map((key) => Language(name: _labels[key]!, locale: _locales[key]!))
      .toList();
  static List<Locale> get locales => _locales.values.toList();
}
