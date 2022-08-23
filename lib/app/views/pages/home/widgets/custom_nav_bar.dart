import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chatme_app/app/logic/cubit/index_page_cubit.dart';

// ignore: must_be_immutable
class ButtomNavBar extends StatelessWidget {
  ButtomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexPageCubit, IndexPageState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.currentIndex,
          onTap: (value) {
            BlocProvider.of<IndexPageCubit>(context).getIndex(value);
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
      },
    );
  }
}
