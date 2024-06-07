import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/config/languages/language.dart';
import 'package:flutter_base_project/config/languages/language_config.dart';
import 'package:flutter_base_project/features/home/domain/usecases/language/get_language.dart';
import 'package:flutter_base_project/features/home/domain/usecases/language/set_language.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;
  final List<Language> languages = LanguageConfig.languages;
  late Language selectedLanguage;

  LanguageBloc(this._getLanguageUseCase, this._setLanguageUseCase)
      : super(const InitialLanguageState()) {
    setInitialLanguage();
    on<LanguageEvent>(setLanguage);
  }

  void setInitialLanguage() {
    final Language storedLanguage = _getLanguageUseCase();
    selectedLanguage = storedLanguage;
  }

  void setLanguage(LanguageEvent event, Emitter<LanguageState> emit) async {
    event.context.setLocale(event.language.locale);
    selectedLanguage = event.language;
    await _setLanguageUseCase(language: selectedLanguage);
    emit(const ChangedLanguageState());
  }
}
