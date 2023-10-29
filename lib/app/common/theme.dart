import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  final primaryColor = const Color(0xfff77110);
  final secondaryColor = const Color(0xffecdbcf);
  final darkColor = const Color(0xff080808);
  final grayColor = const Color(0xff7c7c7c);
  final lightColor = const Color(0xfffafafa);

  final darkTextColor = const Color(0xff080808);
  final grayTextColor = const Color.fromARGB(255, 186, 186, 186);
  ThemeData get themeData => ThemeData(
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.inter().fontFamily,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: darkTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: darkTextColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: darkTextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: darkTextColor,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            color: darkTextColor,
            fontSize: 14,
          ),
          bodySmall: TextStyle(
            color: darkTextColor,
            fontSize: 12,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: darkTextColor,
            fontSize: 16,
            wordSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
          focusColor: primaryColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: TextStyle(
            color: primaryColor,
            fontSize: 16,
            wordSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: TextStyle(
            color: grayTextColor,
          ),
          prefixStyle: TextStyle(
            color: darkTextColor,
          ),
          prefixIconColor: primaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      );
}
