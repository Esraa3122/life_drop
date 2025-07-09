import 'package:life_drop/core/service/shared_pref/pref_keys.dart';
import 'package:life_drop/core/service/shared_pref/shared_pref.dart';

class FontFamilyHelper {
  FontFamilyHelper._();

  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';
  static const String pacifico = 'Pacifico';

  static String geLocalozedFontFamily() {
    final currentLanguage = SharedPref().getString(PrefKeys.language);
    if (currentLanguage == 'ar') {
      return cairoArabic;
    } else {
      return poppinsEnglish;
    }
  }
}
