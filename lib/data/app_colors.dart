import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static Color kPrimary = const Color(0xFFFF69B4);
  static Color kAppBarPink = const Color(0xFFFA94C7);
  static Color kBackgroundPink1 = const Color(0xFFF2BED1);
  static Color kBackgroundPink2 = const Color(0xFFF8E8EE);
  static Color kBackgroundPink3 = const Color(0xFFF9F5F6);
  static Color kWhite = const Color(0xFFFFFFFF);
  static Color kBlack = const Color(0xFF000000);
  static Color kAppBarGrey = const Color(0xFFCCCCCC);
  static Color kGrey = const Color.fromARGB(255, 162, 149, 158);
  static Color kLightGrey = const Color.fromARGB(255, 249, 246, 247);
  static Color kFloatingGrey = const Color(0xFFF3F0F0);
  static Color kVisaStart = const Color(0xFF5BBCFF);
  static Color kVisaMid = Color.fromARGB(255, 54, 133, 173);
  static Color kVisaEnd = Color.fromARGB(255, 5, 47, 84);
  static Color kMasterStart = const Color(0x800080FF);
  static Color kMasterMid = const Color(0x805580FF);
  static Color kMasterEnd = const Color(0x80FF80FF);
  static Color kEasyPaisaStart= Color.fromARGB(128, 69, 207, 124);
  static Color kEasyPaisaMid= Color.fromARGB(128, 85, 207, 174);
  static Color kEasyPaisaEnd= Color.fromARGB(74, 36, 147, 159);
  static Color kJazzCashStart= Color.fromARGB(0, 139, 57, 55);
  static Color kJazzCashMid= Color.fromARGB(68, 235, 89, 82);
  static Color kJazzCashEnd= Color.fromARGB(19, 240, 217, 102);


  static const defaultOverlay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    // systemNavigationBarColor: Colors.transparent,
    // systemNavigationBarDividerColor: Colors.transparent,
    // systemNavigationBarIconBrightness: Brightness.dark
  );
}
