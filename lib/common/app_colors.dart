import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

class AppColors {
  static MaterialColor primary =
      generateMaterialColor(color: const Color(0xff57B77D));
  static const Color white = Colors.white;
  static const Color divider = Color(0xffEAEEF2);
  static const Color warning = Color(0xffE8A13A);
  static const Color danger = Color(0xffDD524C);
  static MaterialColor nuetral =
      generateMaterialColor(color: const Color(0xff081C2C));
}
