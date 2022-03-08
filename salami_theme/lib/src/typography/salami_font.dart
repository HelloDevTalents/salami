import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salami_theme/salami_theme.dart';

/// Very Good Text Style Definitions
abstract class SalamiTextStyle {
  static const _baseTextStyle = TextStyle(
    fontWeight: SalamiFontWeight.regular,
    height: 1.5,
    package: 'Salami_theme',
    fontFamily: 'Mulish',
    color: SalamiColors.black,
  );

  /// Headline 1 Text Style
  static final TextStyle headline1 = _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: SalamiFontWeight.bold,
    height: 1.25,
  );

  /// Headline 2 Text Style
  static final TextStyle headline2 = _baseTextStyle.copyWith(
    fontSize: 25,
    fontWeight: SalamiFontWeight.bold,
    height: 1.25,
  );

  /// Headline 3 Text Style
  static final TextStyle headline3 = _baseTextStyle.copyWith(
    fontSize: 21,
    fontWeight: SalamiFontWeight.bold,
    height: 1.25,
  );

  /// Headline 4 Text Style
  static final TextStyle headline4 = _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: SalamiFontWeight.bold,
    height: 1.25,
  );

  /// Headline 5 Text Style
  static final TextStyle headline5 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: SalamiFontWeight.bold,
    height: 1.25,
  );

  /// Headline 6 Text Style
  static final TextStyle headline6 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: SalamiFontWeight.bold,
    height: 1.25,
  );

  static final TextStyle headline7 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: SalamiFontWeight.semiBold,
    height: 1.25,
  );

  /// Subtitle 1 Text Style
  static final TextStyle subtitle1 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: SalamiFontWeight.bold,
  );

  /// Body Text 1 Text Style
  static final TextStyle bodyText1 = _baseTextStyle.copyWith(
    fontSize: 16,
  );

  /// Body Text 2 Text Style (the default)
  static final TextStyle bodyText2 = _baseTextStyle.copyWith(
    fontSize: 14,
  );

  /// Body Text 3 Text Style
  static final TextStyle bodyText3 = _baseTextStyle.copyWith(
    fontSize: 13,
  );

  static final TextStyle bodyText4 = _baseTextStyle.copyWith(
    fontSize: 13,
    decoration: TextDecoration.underline,
  );

  /// Button Text Style
  static final TextStyle button = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: SalamiFontWeight.bold,
  );

  /// Caption Text Style
  static final TextStyle caption = _baseTextStyle.copyWith(
    fontSize: 13,
    fontWeight: SalamiFontWeight.regular,
  );

  /// Overline Text Style
  static final TextStyle overline = _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: SalamiFontWeight.regular,
  );

  static final TextStyle tag = _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: SalamiFontWeight.bold,
  );

  static final TextStyle indication = _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: SalamiFontWeight.bold,
  );
}

abstract class SalamiFontWeight {
  static const FontWeight bold = FontWeight.w700;

  static const FontWeight semiBold = FontWeight.w600;

  static const FontWeight regular = FontWeight.w400;
}
