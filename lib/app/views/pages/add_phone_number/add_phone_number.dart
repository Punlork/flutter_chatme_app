import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/add_name/add_name_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/verification_code/verification_code_page.dart';
import 'package:flutter_chatme_app/app/views/widgets/custom_button.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AddPhoneNumber extends StatelessWidget {
  const AddPhoneNumber({super.key});

  static const String routePath = '/add_phone_number';
  static const String routeName = 'add_phone_number';

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
              "What's your phone number?",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 20),
            Text(
              'We will send you the verification code.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 20),
            Text(
              'Phone number',
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
                  SvgPicture.asset('assets/icons/flag/ID.svg'),
                  const SizedBox(width: 10),
                  Text(
                    '+885',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
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
            GoRouter.of(context).goNamed(VerificationCodePage.routeName);
          },
        ),
      ),
    );
  }
}
