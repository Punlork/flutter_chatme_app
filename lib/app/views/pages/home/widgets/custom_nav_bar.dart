import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ButtomNavBar extends StatefulWidget {
  ButtomNavBar({
    super.key,
    required this.currentIndex,
  });

  int currentIndex;

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (value) {
        setState(() {
          widget.currentIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          label: 'Call',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
