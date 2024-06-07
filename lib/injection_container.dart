import 'package:get_it/get_it.dart';
import 'package:flutter_base_project/features/home/data/datasource/local/language_store.dart';
import 'package:flutter_base_project/features/home/data/datasource/local/theme_store.dart';
import 'package:flutter_base_project/features/home/data/managers/local/local_storage.dart';
import 'package:flutter_base_project/features/home/data/managers/local/shared_preference.dart';
import 'package:flutter_base_project/features/home/data/repositories/language.dart';
import 'package:flutter_base_project/features/home/data/repositories/theme.dart';
import 'package:flutter_base_project/features/home/domain/repositories/language.dart';
import 'package:flutter_base_project/features/home/domain/repositories/theme.dart';
import 'package:flutter_base_project/features/home/domain/usecases/language/get_language.dart';
import 'package:flutter_base_project/features/home/domain/usecases/language/set_language.dart';
import 'package:flutter_base_project/features/home/domain/usecases/theme/get_theme.dart';
import 'package:flutter_base_project/features/home/domain/usecases/theme/set_theme.dart';
import 'package:flutter_base_project/features/home/presentation/bloc/language/language_bloc.dart';
import 'package:flutter_base_project/features/home/presentation/bloc/theme/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register Dependencies
  sl.registerSingleton<LocalStorageManager>(
      SharedPreferenceManager(sl<SharedPreferences>()));

  sl.registerSingleton<ThemeStore>(ThemeStore(sl<LocalStorageManager>()));
  sl.registerSingleton<ThemeRepo>(ThemeRepoImpl(sl<ThemeStore>()));

  sl.registerSingleton<LanguageStore>(LanguageStore(sl<LocalStorageManager>()));
  sl.registerSingleton<LanguageRepo>(LanguageRepoImpl(sl<LanguageStore>()));

  // UseCases
  sl.registerSingleton<GetThemeUseCase>(GetThemeUseCase(sl<ThemeRepo>()));
  sl.registerSingleton<SetThemeUseCase>(SetThemeUseCase(sl<ThemeRepo>()));

  sl.registerSingleton<GetLanguageUseCase>(
      GetLanguageUseCase(sl<LanguageRepo>()));
  sl.registerSingleton<SetLanguageUseCase>(
      SetLanguageUseCase(sl<LanguageRepo>()));

  // Bloc
  sl.registerFactory<ThemeBloc>(
      () => ThemeBloc(sl<GetThemeUseCase>(), sl<SetThemeUseCase>()));
  sl.registerFactory<LanguageBloc>(
      () => LanguageBloc(sl<GetLanguageUseCase>(), sl<SetLanguageUseCase>()));
}
