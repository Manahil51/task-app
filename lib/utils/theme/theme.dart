import 'package:flutter/material.dart';

import 'package:taskk/utils/theme/appbar.theme.dart';
import 'package:taskk/utils/theme/bottomsheettheme.dart';
import 'package:taskk/utils/theme/elevatedbuttontheme.dart';
import 'package:taskk/utils/theme/textfiels.dart';
import 'package:taskk/utils/theme/texttheme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData LightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "poppins",
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.LightTextTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.LightBottomSheetTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: TTextFormTheme.lightInputDecorationtheme);

  static ThemeData DarkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "poppins",
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.DarkTextTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      inputDecorationTheme: TTextFormTheme.darkInputDecorationtheme);
}
