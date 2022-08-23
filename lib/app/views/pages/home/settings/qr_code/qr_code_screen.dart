import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  static const String routePath = '/qr_code_screen';
  static const String routeName = 'qr_code_screen';

  @override
  Widget build(BuildContext context) {
    final double _circleProfile = 100;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppData.appPadding),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const SizedBox(height: 50),
                    Text(
                      'Roberto William',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.nuetral[900],
                      ),
                    ),
                    Text(
                      '+61-827-680-673',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.nuetral[300],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Image.asset('assets/images/qrcode.png'),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: _circleProfile / 0.7),
                child: Container(
                  width: _circleProfile,
                  height: _circleProfile,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: ClipOval(
                    child: Image.asset('assets/images/Ellipse 18.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _circleProfile / 2),
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: Icon(
                  Icons.navigate_before,
                  size: 30,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        color: AppColors.primary,
        child: Center(
          child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColors.white.withOpacity(0.3),
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                    horizontal: AppData.appPadding, vertical: 15),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt_outlined,
              color: AppColors.white,
            ),
            label: Text(
              'Scan QR Code',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
