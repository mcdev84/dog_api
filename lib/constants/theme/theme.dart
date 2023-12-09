import 'package:dog_breeds/constants/theme/appbar_theme.dart';
import 'package:dog_breeds/constants/theme/button_theme.dart';
import 'package:dog_breeds/constants/theme/card_theme.dart';
import 'package:dog_breeds/constants/theme/color/color_scheme.dart';
import 'package:dog_breeds/constants/theme/input_decoration_theme.dart';
import 'package:dog_breeds/constants/theme/text_theme.dart';
import 'package:flutter/material.dart';


final ThemeData appTheme = ThemeData(
  buttonTheme:buttonTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: appBarTheme,
  cardTheme: cardTheme,
  colorScheme: colorScheme,
  inputDecorationTheme: inputDecorationTheme,
  scaffoldBackgroundColor: Colors.white,
  textTheme: textTheme,
  useMaterial3: true,
);
