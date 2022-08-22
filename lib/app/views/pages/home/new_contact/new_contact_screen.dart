import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/widgets/custom_button.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NewContactScreen extends StatelessWidget {
  NewContactScreen({super.key}) {
    circleRadius = 150;
  }

  static const String routePath = '/new_contact_screen';
  static const String routeName = 'new_contact_screen';
  late final double circleRadius;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  color: AppColors.primary,
                ),
                Padding(
                  padding: EdgeInsets.only(top: circleRadius / 1.3),
                  child: Container(
                    width: circleRadius,
                    height: circleRadius,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const ClipOval(
                          child: Placeholder(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: circleRadius / 15),
                          child: GestureDetector(
                            onTap: () {
                              // print('Tapped!');
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              child: const Icon(
                                Icons.photo_camera_rounded,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: const Icon(Icons.navigate_before),
                    ),
                    const SizedBox(width: 100),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: circleRadius / 2.5),
                      child: Text(
                        'New Contact',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppData.appPadding,
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  const CustomNewContactTextField(
                    iconData: Icons.person,
                    hintText: 'First Name',
                    title: 'First Name',
                  ),
                  const SizedBox(height: 30),
                  const CustomNewContactTextField(
                    iconData: Icons.person,
                    hintText: 'Last Name',
                    title: 'Last Name',
                  ),
                  const SizedBox(height: 30),
                  const CustomNewContactTextField(
                    iconData: Icons.flag,
                    hintText: 'Phone Number',
                    title: 'Phone Number',
                  ),
                  SvgPicture.asset('assets/icons/Solid/qrcode.svg'),
                  Text(
                    'Or add via QR code',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppData.appPadding,
          vertical: 10,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: MediaQuery.of(context).size.height * 0.1,
        child: CustomButton(title: 'Save', onPressed: () {}),
      ),
    );
  }
}

class CustomNewContactTextField extends StatelessWidget {
  const CustomNewContactTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.iconData,
  });

  final String title;
  final String hintText;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.divider),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppData.appPadding,
            vertical: 5,
          ),
          child: TextField(
            decoration: InputDecoration(
              icon: Icon(iconData),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
