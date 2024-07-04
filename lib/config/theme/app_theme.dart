import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix_academy/config/constants/color_contants.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          shadowColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          color: ColorPalette.primary,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: ColorPalette.primary.withOpacity(0.2),
          filled: true,
          hintStyle: TextStyle(
            color: ColorPalette.primary.withOpacity(0.4),
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          labelStyle: TextStyle(
            color: ColorPalette.primary.withOpacity(0.4),
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          floatingLabelStyle: const TextStyle(
            color: ColorPalette.primary,
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          counterStyle: const TextStyle(
            color: ColorPalette.primary,
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIconColor: ColorPalette.primary,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorPalette.primary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorPalette.primary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorPalette.primary, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 8.0,
            shadowColor: ColorPalette.primary,
            minimumSize: const Size(200.0, 56.0),
            backgroundColor: ColorPalette.primary,
            disabledBackgroundColor: ColorPalette.primary.withOpacity(0.4),
            disabledForegroundColor: Colors.grey,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            textStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: ColorPalette.primary,
              width: 2.0,
            ),
            minimumSize: const Size(200.0, 56.0),
            disabledForegroundColor: Colors.grey,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            textStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            minimumSize: const Size(200.0, 56.0),
            disabledForegroundColor: Colors.grey.shade50,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            textStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      );
}
