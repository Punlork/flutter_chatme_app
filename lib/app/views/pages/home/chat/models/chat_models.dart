import 'package:flutter/material.dart';

class ChatModel {
  final String name;
  final String chat;
  final String time;
  final String? notSeen;
  final IconData? isGroup;
  final IconData? isMusted;
  final String? isSender;

  ChatModel({
    required this.name,
    required this.chat,
    required this.time,
    this.notSeen,
    this.isGroup,
    this.isMusted,
    this.isSender,
  });
}
