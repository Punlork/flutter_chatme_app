import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/add_name/add_name_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/upload_photo/upload_photo_screen.dart';
import 'package:flutter_chatme_app/app/views/widgets/custom_button.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({super.key});
  static const String routePath = '/verification_code_page';
  static const String routeName = 'verification_code_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppData.appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const CustomBackButton(),
            Text(
              'Verification Code',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Enter the code number we sent to +62 85-830-544-382.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                VerficationBox(),
                VerficationBox(),
                VerficationBox(),
                VerficationBox(),
                VerficationBox(),
              ],
            ),
            Center(
              child: Text(
                "If you don't get the code, resend it in 0 seconds.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Center(
              child: Text(
                'Resend code',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.all(AppData.appPadding),
        child: CustomButton(
          title: 'Next',
          onPressed: () {
            GoRouter.of(context).goNamed(AddNameScreen.routeName);
          },
        ),
      ),
    );
  }
}

class VerficationBox extends StatelessWidget {
  const VerficationBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: TextField(
        maxLength: 1,
        decoration: const InputDecoration(counterText: ''),
      ),
    );
  }
}
