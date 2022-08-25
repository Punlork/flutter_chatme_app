import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/new_contact/new_contact_screen.dart';
import 'package:flutter_chatme_app/app/views/widgets/custom_button.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  static const String routePath = '/edit_profile_screen';
  static const String routeName = 'edit_profile_screen';

  @override
  Widget build(BuildContext context) {
    final double _rountProfile = 148;
    void showCustomDialog(BuildContext context) {
      showGeneralDialog(
        context: context,
        barrierLabel: 'Barrier',
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(AppData.appPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/Group 1073.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.camera_alt_rounded,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Take Photo',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.photo,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Choose From Library',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                color: AppColors.primary,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: _rountProfile / 2),
                  child: Container(
                    width: _rountProfile,
                    height: _rountProfile,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.asset('assets/images/Ellipse 18.png'),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  showCustomDialog(context);
                                },
                                icon: Icon(Icons.linked_camera),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _rountProfile / 5, left: 10),
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(
                    Icons.navigate_before,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppData.appPadding,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                CustomNewContactTextField(
                  title: 'Name',
                  hintText: 'Robert John',
                  iconData: Icons.person,
                ),
                const SizedBox(height: 20),
                CustomNewContactTextField(
                  title: 'Phone number',
                  hintText: '85-830-544-382',
                  iconData: Icons.flag,
                ),
              ],
            ),
          )
        ],
      ),
      bottomSheet: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          padding: EdgeInsets.symmetric(
            horizontal: AppData.appPadding,
            vertical: 10,
          ),
          child: CustomButton(title: 'Save', onPressed: () {})),
    );
  }
}
