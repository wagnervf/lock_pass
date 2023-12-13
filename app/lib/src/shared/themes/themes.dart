import 'package:flutter/material.dart';
import 'package:lockpass/src/shared/themes/color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: lightColorScheme.primaryContainer,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary,
      ),
      segmentedButtonTheme: _segmentedButtonTheme(),
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: darkColorScheme.primaryContainer,
      ),
      segmentedButtonTheme: _segmentedButtonTheme(),
    );

// Um gerenciador de estado por Tema
SegmentedButtonThemeData _segmentedButtonTheme() {
  return SegmentedButtonThemeData(style: ButtonStyle(
    
    textStyle: MaterialStateProperty.resolveWith<TextStyle>(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return const TextStyle(fontSize: 9.0);
        }
        return const TextStyle(fontSize: 10.0);
      },
    ),
  ));
}
