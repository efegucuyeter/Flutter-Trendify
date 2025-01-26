import 'package:flutter/material.dart';

class AppColors {
  // Gündüz Modu
  static const Color primary = Colors.orange;
  static const Color secondary = Colors.white;
  static const Color accent = Colors.grey;
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.orange;

  // Gece Modu
  static const Color darkPrimary = Colors.deepOrange;
  static const Color darkSecondary = Colors.black;
  static const Color darkAccent = Colors.grey;
  static const Color darkTextPrimary = Colors.white;
  static const Color darkTextSecondary = Colors.deepOrangeAccent;
}

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.secondary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textPrimary, 
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),
    ),
    iconTheme: const IconThemeData(color: AppColors.textPrimary),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkSecondary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: AppColors.darkTextPrimary, 
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkTextPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14),
    ),
    iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),
  );
}

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
