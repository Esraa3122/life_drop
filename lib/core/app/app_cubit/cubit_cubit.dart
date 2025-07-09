import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_drop/core/service/shared_pref/pref_keys.dart';
import 'package:life_drop/core/service/shared_pref/shared_pref.dart';

part 'cubit_state.dart';
part 'cubit_cubit.freezed.dart';

class CubitCubit extends Cubit<CubitState> {
  CubitCubit() : super(const CubitState.initial());

  bool isDark = true;

  String currentLangCode = 'en';
// Theme Mode
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(CubitState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref()
          .setBoolean(PrefKeys.themeMode, isDark)
          .then((value) => emit(CubitState.themeChangeMode(isDark: isDark)));
    }
  }

  // Language Change
  void getSavedLanguage() {
    final result = SharedPref().containPreference(PrefKeys.language)
        ? SharedPref().getString(PrefKeys.language)
        : 'en';

    currentLangCode = result!;
    emit(CubitState.languageChange(locale: Locale(currentLangCode)));
  }

  Future<void> _changeLange(String langCode) async {
    await SharedPref().setString(PrefKeys.language, langCode);
    currentLangCode = langCode;
    emit(CubitState.languageChange(locale: Locale(currentLangCode)));
  }

  void toArabic() => _changeLange('ar');
  void toEnglish() => _changeLange('en');
}
