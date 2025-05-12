import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycalculator/core/themes/app_colors.dart';

TextTheme getTextTheme() {
  return GoogleFonts.robotoMonoTextTheme(
    TextTheme().copyWith(
      //
    ),
  );
}

class AppThemes {
  ThemeData get lightTheme => ThemeData(
    textTheme: getTextTheme(),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: ColorScheme.light().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.lightSurface,
    ),
  );

  ThemeData get darkTheme => ThemeData(
    textTheme: getTextTheme(),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: ColorScheme.dark().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.darkSurface,
    ),
  );
}
