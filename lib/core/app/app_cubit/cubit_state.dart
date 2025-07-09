part of 'cubit_cubit.dart';

@freezed
class CubitState with _$CubitState {
  const factory CubitState.initial() = _Initial;
  const factory CubitState.themeChangeMode({required bool isDark}) =
      ThemeChangeModeState;
  const factory CubitState.languageChange({required Locale locale}) =
      LanguageChangeState;
}
