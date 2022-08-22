import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHomeScreenAppBar extends StatelessWidget {
  const CustomHomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppData.appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: <Widget>[
              Text(
                'Chats',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(255, 255, 255, 0.16),
              ),
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(255, 255, 255, 0.06),
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: SvgPicture.asset('assets/icons/Outline/search.svg'),
                hintText: 'Search chat, people and more...',
                hintStyle: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}