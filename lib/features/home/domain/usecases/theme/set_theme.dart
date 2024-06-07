import 'package:flutter_base_project/core/usecases/usecase_async.dart';
import 'package:flutter_base_project/features/home/domain/repositories/theme.dart';

class SetThemeUseCase implements UseCaseAsync<void> {
  final ThemeRepo _repo;
  const SetThemeUseCase(this._repo);

  @override
  Future<void> call({String? theme}) async {
    return _repo.setTheme(theme: theme!);
  }
}
