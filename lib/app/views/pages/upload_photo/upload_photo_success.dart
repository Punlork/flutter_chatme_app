import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/homepage_screen.dart';
import 'package:flutter_chatme_app/app/views/widgets/custom_button.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class UploadPhotoSuccess extends StatelessWidget {
  const UploadPhotoSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppData.appPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CustomBackButton(),
          Center(
            child: Text(
              'Upload a photo',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Succes Upload Photo.png',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Done! Your photo',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'successfully uploaded',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppData.appPadding),
            child: CustomButton(
              title: 'Next',
              onPressed: () {
                GoRouter.of(context).goNamed(HomepageScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
