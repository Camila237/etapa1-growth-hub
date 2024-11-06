import 'package:flutter/material.dart';

import 'package:etapa1/config/exports.dart';

class AppTheme{
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    textTheme: _textTheme,
    scaffoldBackgroundColor: kCrayola,
    appBarTheme: AppBarTheme(titleTextStyle: _textTheme.labelLarge!.copyWith(color: kBlack)),
  );

  static TextTheme get _textTheme => const TextTheme(
    labelSmall: TextStyle(fontSize: kSize12, fontWeight: FontWeight.normal),
    labelMedium: TextStyle(fontSize: kSize14, fontWeight: FontWeight.normal),
    labelLarge: TextStyle(fontSize: kSize18, fontWeight: FontWeight.w700),
    titleSmall: TextStyle(fontSize: kSize22, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: kSize24, fontWeight: FontWeight.w600),
    titleLarge: TextStyle(fontSize: kSize32, fontWeight: FontWeight.w700),
    // displaySmall: ,
    displayMedium: TextStyle(fontSize: kSize30, fontWeight: FontWeight.normal),
    // displayLarge:,
    // bodySmall:,
    // bodyMedium: ,
    // bodyLarge:,
    headlineSmall: TextStyle(fontSize: kSize20, fontWeight: FontWeight.normal),
    // headlineMedium: ,
    // headlineLarge:
  );
}