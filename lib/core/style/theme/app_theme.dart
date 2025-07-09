import 'package:flutter/material.dart';
import 'package:life_drop/core/style/colors/colors_dark.dart';
import 'package:life_drop/core/style/colors/colors_light.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/theme/color_extension.dart';
import 'package:life_drop/core/style/theme/assets_extension.dart';

ThemeData themeDark() {
  return ThemeData(
      scaffoldBackgroundColor: ColorsDark.mainColor,
      extensions: const <ThemeExtension<dynamic>>[MyColor.dark, MyAssets.dark],
      useMaterial3: true,
      textTheme: TextTheme(
          displaySmall: TextStyle(
              fontSize: 14,
              color: ColorsDark.white,
              fontFamily: FontFamilyHelper.geLocalozedFontFamily())));
}

ThemeData themeLight() {
  return ThemeData(
      scaffoldBackgroundColor: ColorsLight.mainColor,
      extensions: const <ThemeExtension<dynamic>>[
        MyColor.light,
        MyAssets.light
      ],
      useMaterial3: true,
      textTheme: TextTheme(
          displaySmall: TextStyle(
              fontSize: 14,
              color: ColorsLight.black,
              fontFamily: FontFamilyHelper.geLocalozedFontFamily())));
}
