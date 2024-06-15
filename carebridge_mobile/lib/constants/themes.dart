import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_rock_mobile/constants/app_colors.dart';

// class ThemeProvider extends ChangeNotifier {
//   ThemeMode themeMode = ThemeMode.system;
//   bool get isDarkMode => themeMode == ThemeMode.dark;

//   void toggleTheme(bool isOn) {
//     themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
//     notifyListeners();
//   }
// }

class MyThemes {
  /// lightThemeData

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.carebridgePrimary,
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.carebridgePrimary,
      iconTheme: IconThemeData(color: Colors.grey.shade700),
      titleTextStyle: TextStyle(color: Colors.grey.shade100, fontSize: 22),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),

    colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        background: Colors.grey.shade100,
        primary: AppColors.carebridgePrimary,
        secondary: AppColors.carebridgeSecondary,
        tertiary: AppColors.carebridgeThertiary),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: GoogleFonts.roboto(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.roboto(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),

    // generic icons
    iconTheme: IconThemeData(color: Colors.grey.shade600),

    //buttons
    textButtonTheme: const TextButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.carebridgePrimary,
        textStyle: const TextStyle(fontSize: 18),
        minimumSize: const Size.fromHeight(50),
        disabledBackgroundColor: AppColors.carebridgePrimary.withOpacity(0.1),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        textStyle: const TextStyle(fontSize: 18),
        minimumSize: const Size.fromHeight(50),
        side: const BorderSide(color: AppColors.carebridgePrimary),
      ),
    ),
  );

  // darkThemeData
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.carebridgePrimary,
      iconTheme: IconThemeData(color: Colors.grey.shade100),
      titleTextStyle: TextStyle(color: Colors.grey.shade100, fontSize: 22),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      background: Colors.black,
      primary: AppColors.carebridgePrimary,
      secondary: AppColors.carebridgeSecondary,
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: GoogleFonts.roboto(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: Colors.white70,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.roboto(
        color: Colors.white70,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
