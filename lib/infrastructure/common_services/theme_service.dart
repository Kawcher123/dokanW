import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService extends GetxService {
  late GetStorage _box;

  ThemeService() {
    _box = GetStorage();
  }

  MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  int tintValue(int value, double factor) => max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) =>
      Color.fromRGBO(tintValue(color.red, factor), tintValue(color.green, factor), tintValue(color.blue, factor), 1);

  int shadeValue(int value, double factor) => max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) =>
      Color.fromRGBO(shadeValue(color.red, factor), shadeValue(color.green, factor), shadeValue(color.blue, factor), 1);

  ThemeData getLightTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: const Color(0xfff75f55),
        primarySwatch: generateMaterialColor(
          const Color(0xfff75f55),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Color(0xfff75f55),
        ),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.95),
        brightness: Brightness.light,
        //  colorSchemeSeed: const Color(0xffec008c),
        dividerColor: Colors.grey.shade800,
        focusColor: const Color(0xfff75f55),
        hintColor: Colors.grey,
        splashColor: Colors.grey.shade200,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xfff75f55),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white.withOpacity(0.95),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xfff75f55),
          secondary: Color(0xfff75f55),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.black, height: 1.3),
          headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black, height: 1.3),
          headlineMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.black, height: 1.3),
          displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black, height: 1.3),
          displayMedium: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: Color(0xfff75f55), height: 1.4),
          displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Colors.black, height: 1.4),
          titleSmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.black, height: 1.2),
          titleMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Color(0xfff75f55), height: 1.2),
          bodyMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Colors.black, height: 1.2),
          bodyLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Color(0xff2b2b2b), height: 1.2),
          bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Color(0xfff75f55), height: 1.2),
        )

        //GoogleFonts.latoTextTheme(const )

        );
  }

  ThemeData getDarkTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: const Color(0xfff75f55),
        primarySwatch: generateMaterialColor(
          const Color(0xfff75f55),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Color(0xfff75f55),
        ),
        scaffoldBackgroundColor: const Color(0xffedf1f3),
        brightness: Brightness.dark,
        // colorSchemeSeed: Colors.blue,
        dividerColor: Colors.white38,
        focusColor: const Color(0xfff75f55),
        hintColor: Colors.white38,
        splashColor: const Color(0xFF2C2C2C),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xfff75f55),
          ),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xfff75f55),
          secondary: Colors.white38,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white.withOpacity(0.95),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Color(0xfff75f55), height: 1.3),
          headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Color(0xfff75f55), height: 1.3),
          headlineMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.white, height: 1.3),
          displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.white, height: 1.3),
          displayMedium: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: Color(0xfff75f55), height: 1.4),
          displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Colors.white, height: 1.4),
          titleSmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.white, height: 1.2),
          titleMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Color(0xfff75f55), height: 1.2),
          bodyMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Colors.white, height: 1.2),
          bodyLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Color(0xff2b2b2b), height: 1.2),
          bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Color(0xfff75f55), height: 1.2),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return const Color(0xfff75f55);
            }
            return null;
          }),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return const Color(0xfff75f55);
            }
            return null;
          }),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return const Color(0xfff75f55);
            }
            return null;
          }),
          trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return const Color(0xfff75f55);
            }
            return null;
          }),
        )

        //  GoogleFonts.getTextTheme("Poppins",)

        );
  }

  ThemeMode getThemeMode() {
    String? themeMode = GetStorage().read<String>('theme_mode');
    switch (themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black),
        );
        return ThemeMode.dark;
      default:
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
    }
  }
}
