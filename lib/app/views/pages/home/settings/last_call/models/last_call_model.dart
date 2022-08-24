import 'package:flutter/material.dart';

class LastCallModel {
  final String name;
  final String callStatus;
  final String time;
  final IconData phoneIcon = Icons.phone_callback;
  final IconData detailIcon = Icons.info_outline;

  LastCallModel({
    required this.name,
    required this.callStatus,
    required this.time,
  });
}
