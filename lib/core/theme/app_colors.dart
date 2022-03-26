import 'package:flutter/material.dart';

const _neutral = <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(0xFFF9FAFC),
  250: Color(0xFFf7f7f8),
  300: Color(0xFFF4F6FA),
  350: Color(0xFFE6E9EC),
  400: Color(0xFFE2E8F0),
  450: Color(0xFFacacac),
  500: Color(0xFF94A3B8),
  600: Color(0xFF8E9DB3),
  700: Color(0xFF475569),
  800: Color(0xFF1E293B),
  900: Color(0xFF0F172A),
};

const _icons = <int, Color>{
  300: Color(0xFFABABAB),
  500: Color(0xFF2B2D32),
};

const _primary = <int, Color>{
  300: Color(0xFFABABAB),
  500: Color(0xFF2B2D32),
};

const _secundary = <int, Color>{
  300: Color(0xFFABABAB),
};

const _red = <int, Color>{
  100: Color(0xFFDD3232),
};

const _yellow = <int, Color>{
  500: Color(0xFFDDED00),
};

abstract class AppColors {
  static const MaterialColor neutral = MaterialColor(0xFFFFFFFF, _neutral);
  static const MaterialColor primary = MaterialColor(0xFF2B2D32, _primary);
  static const MaterialColor secundary = MaterialColor(0xFFABABAB, _secundary);
  static const MaterialColor display = MaterialColor(0xFFFFFFFF, _neutral);
  static const MaterialColor red = MaterialColor(0xFFDD3232, _red);
  static const MaterialColor yellow = MaterialColor(0xFFDDED00, _yellow);
  static const MaterialColor icons = MaterialColor(0xFF2B2D32, _icons);
}
