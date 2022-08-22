import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/widgets/custom_button.dart';
import 'package:flutter_chatme_app/common/app_data.dart';

class UploadPhotoLoading extends StatelessWidget {
  const UploadPhotoLoading({super.key});

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
                  'assets/images/Indicator Loading Upload.png',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Wait a second, your photo',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'still uploading',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        ],
      ),
    );
  }
}
