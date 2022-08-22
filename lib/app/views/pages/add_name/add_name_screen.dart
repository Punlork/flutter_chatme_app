import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/upload_photo/upload_photo_screen.dart';
import 'package:flutter_chatme_app/app/views/widgets/custom_button.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AddNameScreen extends StatelessWidget {
  const AddNameScreen({super.key});

  static const String routePath = '/add_name_screen';
  static const String routeName = 'add_name_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppData.appPadding,
          vertical: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "What's your name?",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 20),
            Text(
              'Write your name. You can change it back in settings.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 20),
            Text(
              'Name',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppData.appPadding,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.divider,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/Solid/user.svg'),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.all(AppData.appPadding),
        child: CustomButton(
          title: 'Next',
          onPressed: () {
            GoRouter.of(context).goNamed(UploadPhotoScreen.routeName);
          },
        ),
      ),
    );
  }
}
