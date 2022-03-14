import 'package:flutter/material.dart';
import 'package:salami_theme/salami_theme.dart';

/// Default `ThemeData` for Salami UI.
abstract class SalamiTheme {
  ///Theme data
  static ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(color: SalamiColors.gunmetal),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: SalamiColors.metallicSaeweed,
    ),
  );
}
