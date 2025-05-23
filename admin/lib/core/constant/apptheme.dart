import "package:flutter/material.dart";

import 'color.dart';

ThemeData themeEnglish = ThemeData(
    appBarTheme: const AppBarTheme(
      // color: AppColor.primaryColor,
      // foregroundColor: AppColor.fourthColor,
      // backgroundColor: Colors.grey[50],
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.backgroundcolor),
      titleTextStyle: TextStyle(
        // color: AppColor.primaryColor,
        color: Colors.white,

        fontWeight: FontWeight.bold,
        fontSize: 24,
        // fontFamily: "Muli"
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      // foregroundColor: AppColor.fourthColor
    ),
    fontFamily: "Muli",
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headlineSmall: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: AppColor.black),
      headlineMedium: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 28, color: AppColor.black),
      bodySmall: TextStyle(height: 1.7, color: AppColor.grey, fontSize: 15),
      bodyMedium: TextStyle(
          height: 1.7,
          color: AppColor.grey,
          fontWeight: FontWeight.w500,
          fontSize: 15),
    ));
ThemeData themeArabic = ThemeData(
    appBarTheme: const AppBarTheme(
      // backgroundColor: Colors.grey[50],
      backgroundColor: AppColor.primaryColor,

      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleTextStyle: TextStyle(
        // color: AppColor.primaryColor,
        color: Colors.white,

        fontWeight: FontWeight.bold,
        fontSize: 24,
        // fontFamily: "Cairo"
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    // fontFamily: "Cairo",
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headlineSmall: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: AppColor.black),
      headlineMedium: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 28, color: AppColor.black),
      bodySmall: TextStyle(height: 1.7, color: AppColor.grey, fontSize: 15),
      bodyMedium: TextStyle(
          height: 1.7,
          color: AppColor.grey,
          fontWeight: FontWeight.w500,
          fontSize: 15),
    ));
