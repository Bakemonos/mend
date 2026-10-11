import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/colors.dart';
import 'package:mend/core/constants/icons.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/shared/widgets/svg.dart';

abstract class MyTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.surface,
      navigationBarTheme: _navigationBarTheme(isDark: false),
      textTheme: _textTheme(isDark: false),
      inputDecorationTheme: _inputTheme(isDark: false),
      actionIconTheme: _actionIconTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(isDark: false),
      outlinedButtonTheme: _outlinedButtonTheme(isDark: false),
      colorScheme: ColorScheme(
        brightness: Brightness.light, 

        primary: AppColor.primary, 
        onPrimary: AppColor.textBlack, 
        
        secondary: AppColor.primarySoft, 
        onSecondary: AppColor.textSecondary, 

        surface: AppColor.surface, 
        onSurface: AppColor.textBlack,

        outline: AppColor.line,


        error: AppColor.red, 
        onError: AppColor.textWhite, 
      )
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.navDarkTop,
      navigationBarTheme: _navigationBarTheme(isDark: true),
      textTheme: _textTheme(isDark: true),
      inputDecorationTheme: _inputTheme(isDark: true),
      actionIconTheme: _actionIconTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(isDark: true),
      outlinedButtonTheme: _outlinedButtonTheme(isDark: true),
      colorScheme: ColorScheme(
        brightness: Brightness.dark, 

        primary: AppColor.primary, 
        onPrimary: AppColor.textWhite, 
        
        secondary: AppColor.primarySoft, 
        onSecondary: AppColor.textSecondaryDark, 

        surface: AppColor.surfaceDark, 
        onSurface: AppColor.textWhite,

        outline: AppColor.lineDark,

        error: AppColor.red, 
        onError: AppColor.textWhite, 
      )
      
    );
  }

  static TextTheme _textTheme({required bool isDark}) {
    final color = isDark ? AppColor.textWhite : AppColor.textBlack;
    final muted = isDark ? AppColor.textSecondaryDark : AppColor.textSecondary;

    return TextTheme(
      headlineLarge: TextStyle(fontSize: AppSize.fontHuge.sp, fontWeight: FontWeight.w700, color: color),
      headlineMedium: TextStyle(fontSize: AppSize.fontExtraLarge.sp, fontWeight: FontWeight.w600, color: color),
      headlineSmall: TextStyle(fontSize: AppSize.fontMediumLarge.sp, fontWeight: FontWeight.w600, color: color),
      
      titleLarge: TextStyle(fontSize: AppSize.fontLarge.sp, fontWeight: FontWeight.w600, color: color),
      titleMedium: TextStyle(fontSize: AppSize.fontMediumLarge.sp, fontWeight: FontWeight.w600, color: color),
      titleSmall: TextStyle(fontSize: AppSize.fontMedium.sp, fontWeight: FontWeight.w400, color: muted),

      bodyLarge: TextStyle(fontSize: AppSize.fontLarge.sp, fontWeight: FontWeight.w500, color: color),
      bodyMedium: TextStyle(fontSize: AppSize.fontMedium.sp, fontWeight: FontWeight.w500, color: color),
      bodySmall: TextStyle(fontSize: AppSize.fontSmall.sp, fontWeight: FontWeight.w400, color: muted),

      labelLarge: TextStyle(fontSize: AppSize.fontLarge.sp, fontWeight: FontWeight.w600, color: color),
      labelMedium: TextStyle(fontSize: AppSize.fontMedium.sp, fontWeight: FontWeight.w600, color: color),
      labelSmall: TextStyle(fontSize: AppSize.fontExtraSmall.sp, fontWeight: FontWeight.w500, color: muted),
    );
  }

  static NavigationBarThemeData _navigationBarTheme({required bool isDark}) {
    final accent = isDark ? AppColor.primaryDark : AppColor.primary;
    final inactive = isDark ? AppColor.navDarkInactive : AppColor.navLightInactive;

    return NavigationBarThemeData(
      backgroundColor: isDark ? AppColor.navDarkBar : AppColor.navLightBar,
      surfaceTintColor: Colors.transparent,
      elevation: 8,
      indicatorColor: isDark
        ? AppColor.navDarkPill
        : AppColor.navigationTint,
      indicatorShape: const StadiumBorder(),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(size: 26, color: selected ? accent : inactive);
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return TextStyle(
          fontFamily: 'Inter',
          fontSize: AppSize.fontSmall.sp,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          color: selected ? accent : inactive,
        );
      }),
    );
  }

  static InputDecorationTheme _inputTheme({required bool isDark}) {
    final hint = isDark ? AppColor.textSecondaryDark : AppColor.textSecondary;
    final accent = isDark ? AppColor.primaryDark : AppColor.primary;
    final line = isDark ? AppColor.lineDark : AppColor.line;

    OutlineInputBorder border(Color color, {double width = 1}) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMedium.r),
      borderSide: BorderSide(color: color, width: width.w),
    );

    return InputDecorationTheme(
      filled: true,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      hintStyle: TextStyle(fontSize: AppSize.fontMedium.sp, color: hint),
      prefixIconColor: hint,
      suffixIconColor: hint,
      border: border(line),
      enabledBorder: border(line),
      focusedBorder: border(accent, width: 1.5),
      errorBorder: border(Colors.red),
      focusedErrorBorder: border(Colors.red, width: 1.5),
      disabledBorder: border(line),
    );
  }

  static ActionIconThemeData _actionIconTheme() {
    return ActionIconThemeData(
      backButtonIconBuilder: (context) => MySvg(
        assetPath: AppIcon.svgArrowLeft,
        size: AppSize.iconMedium.w,
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme({required bool isDark}) {

    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.textWhite,
        backgroundColor: AppColor.primary,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppSize.radiusLarge.r)
        ),
        textStyle: TextStyle(fontSize: AppSize.fontMediumLarge.sp),
      )
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme({required bool isDark}) {
    final foregroundColor = isDark ? AppColor.textWhite : AppColor.textBlack;
    final borderColor = isDark ? AppColor.lineDark : AppColor.lineButton;

    return OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        side: BorderSide(
          width: AppSize.borderSuperTiny.w,
          color: borderColor
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppSize.radiusLarge.r)
        ),
        textStyle: TextStyle(fontSize: AppSize.fontMediumLarge.sp),
      )
    );
  }
}