import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/upload_photo/upload_photo_loading.dart';
import 'package:flutter_chatme_app/app/views/pages/upload_photo/upload_photo_success.dart';
import 'package:flutter_chatme_app/app/views/widgets/custom_button.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadPhotoScreen extends StatelessWidget {
  UploadPhotoScreen({super.key}) {
    _uploads = [
      const UploadPhoto(),
      const UploadPhotoLoading(),
      const UploadPhotoSuccess(),
    ];
  }

  static const String routePath = '/upload_photo_screen';
  static const String routeName = 'upload_photo_screen';

  late final List<Widget> _uploads;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          return _uploads[index];
        },
        itemCount: _uploads.length,
        // physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({
    super.key,
  });

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  @override
  Widget build(BuildContext context) {
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
              height: MediaQuery.of(context).size.height * 0.2,
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
                    onTap: () {
                      setState(() {});
                    },
                    child: Image.asset('assets/images/Group 1073.png'),
                  ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset('assets/icons/Solid/camera.svg'),
                      const SizedBox(width: 20),
                      Text(
                        'Take Photo',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset('assets/icons/Solid/photograph.svg'),
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
        transitionBuilder: (_, anim, __, child) {
          Tween<Offset> tween;
          if (anim.status == AnimationStatus.reverse) {
            tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
          } else {
            tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
          }

          return SlideTransition(
            position: tween.animate(anim),
            child: FadeTransition(
              opacity: anim,
              child: child,
            ),
          );
        },
      );
    }

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
          Center(
            child: Image.asset(
              'assets/images/Illustration - Upload Photo.png',
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppData.appPadding),
            child: CustomButton(
              title: 'Upload Photo',
              onPressed: () => showCustomDialog(context),
            ),
          ),
        ],
      ),
    );
  }
}
