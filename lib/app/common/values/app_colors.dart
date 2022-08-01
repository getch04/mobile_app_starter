import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimaryColor = Color(0xFF1976D2);
  static const Color mineShaft = Color(0xFF2B2B2B);
  static const Color doveGray = Color(0xFF646464);
  static const Color caribbeanGreen = Color(0xFF06C5AC);
  static const Color amaranth = Color(0xFFea435d);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static Color lightGray = Color(0xFFF6F6F6);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
