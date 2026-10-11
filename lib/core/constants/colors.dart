import 'package:flutter/material.dart';

abstract class AppColor {
  //? Brand
  static const primary = Color(0xFF2196F3);
  static const primarySoft = Color(0xFFE3F2FD);
  static const background = Color(0xFF1E1F24);
  static const lineLight = Color(0xFFD9E2EC);

  //? Light mode
  static const textBlack = Color(0xFF172D34);
  static const textSecondary = Color(0xFF6B7C81);

  static const surface = Color(0xFFFFFFFF);

  //? Dark mode
    static const textWhite = Color(0xFFFFFFFF);
  static const textSecondaryDark = Color(0xFF9FB0B6);

  static const primaryDark = Color(0xFF7CC4FF);
  static const surfaceDark = Color(0xFF272A31); 
  static const mutedDark = Color(0xFF30343C);

  //? SOLID
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF172D34);

  static const line = Color(0xFFE4EBEB);
  static const lineDark = Color(0xFF3D424B);
  static const lineButton = Color(0xFFA9B9BC);
  static const lineStrong = Color(0xFF8FA1A6);

  static get primaryFade => AppColor.primary.withValues(alpha: 0.12);
  static get navigationTint => AppColor.primary.withValues(alpha: 0.12);
 
  //? STATUS
  static const green = Color(0xFF2A9365);
  static const greenSoft = Color(0xFFE7F6EE);
  static const orange = Color(0xFFD98026);
  static const orangeSoft = Color(0xFFFFF4DF);
  static const red = Color(0xFFC54D4D);
  static const redSoft = Color(0xFFFCECEC);

  //? Navigation bar
  static const navDarkBar = Color(0xFF1B222A);
  static const navDarkTop = Color(0xFF11161C);
  static const navDarkPill = Color(0xFF22344A);
  static const navDarkInactive = Color(0xFF6B7785);
  static const navLightBar = Colors.white;
  static const navLightInactive = Color(0xFF4A5565);
 
}
 

