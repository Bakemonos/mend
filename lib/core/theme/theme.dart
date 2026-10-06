import 'package:flutter/material.dart';
import 'package:mend/core/constants/colors.dart';

abstract class MyTheme { 

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.background,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
 
        primary: AppColor.primary,
        onPrimary: AppColor.onPrimary,
 
        secondary: AppColor.primaryDark,
        onSecondary: AppColor.muted,
 
        //? BACKGROUND
        surface: AppColor.surface,
        onSurface: AppColor.line,
 
        tertiary: AppColor.surface,
        tertiaryFixedDim: AppColor.ink,
 
        surfaceDim: AppColor.background,
        surfaceContainer: AppColor.pageBackground,
        surfaceBright: AppColor.greenSoft,
 
        surfaceTint: AppColor.greenSoft,
        surfaceContainerHigh: AppColor.orangeSoft,
        surfaceContainerLow: AppColor.blueSoft,
        surfaceContainerLowest: AppColor.surface,
 
        onPrimaryContainer: AppColor.green,
        onSecondaryContainer: AppColor.blue,
        onTertiaryContainer: AppColor.orange,
 
        //? BORDER
        outline: AppColor.line,
 
        //? STATUS
        error: AppColor.red,
        onError: AppColor.red,
      ),
    );
  }
  

}