import 'package:flutter/material.dart';

TextStyle textStyle(
        {required double fontSize,
        FontWeight? fontWeight,
        FontStyle? fontStyle}) =>
    TextStyle(
        fontFamily: 'SometypeMono',
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal);

const noUnderlineText = TextStyle(
  decoration: TextDecoration.none,
  decorationThickness: 0,
);
