import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/new_contact/new_contact_screen.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:go_router/go_router.dart';

class HeaderSettingScreens extends StatelessWidget {
  const HeaderSettingScreens({
    Key? key,
    required this.title,
    this.height,
    this.textField,
  }) : super(key: key);

  final String title;
  final double? height;
  final CustomNewContactTextField? textField;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.1,
      padding: height != null ? EdgeInsets.only(top: 10) : null,
      color: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: Icon(Icons.navigate_before),
                iconSize: 30,
                color: AppColors.white,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              // SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            ],
          ),
          textField != null ? textField! : SizedBox(),
        ],
      ),
    );
  }
}
