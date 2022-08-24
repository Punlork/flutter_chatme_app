import 'package:flutter/cupertino.dart';

class SettingModel {
  final String name;
  final String? routeName;
  final IconData icon;

  SettingModel({
    required this.name,
    required this.icon,
    this.routeName,
  });
}
