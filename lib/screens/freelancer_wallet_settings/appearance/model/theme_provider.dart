import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final skupalThemeProvider = Provider<SkupalThemes>((ref) {
  final theme = ref.watch(themeProv);
  return SkupalThemes();
});
final themeProv = Provider((ref) => ThemeProvider);

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isLightMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class SkupalThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark());

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light());
}
