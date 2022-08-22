import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({
    super.key,
  });

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  late int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/Solid/phone.svg'),
          label: 'Call',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/Solid/chat.svg'),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/Solid/cog.svg'),
          label: 'Settings',
        ),
      ],
    );
  }
}
