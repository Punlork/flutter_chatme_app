import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chatme_app/app/views/pages/add_name/add_name_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/add_phone_number/add_phone_number.dart';
import 'package:flutter_chatme_app/app/views/pages/home/homepage_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/new_chat/new_chat_typing_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/onboarding/onborading_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/splash/splash_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/upload_photo/upload_photo_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/verification_code/verification_code_page.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class Main extends StatelessWidget {
  Main({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: SplashScreen.routePath,
        name: SplashScreen.routeName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: OnboradingScreen.routePath,
        name: OnboradingScreen.routeName,
        builder: (context, state) => const OnboradingScreen(),
      ),
      GoRoute(
        path: AddPhoneNumber.routePath,
        name: AddPhoneNumber.routeName,
        builder: (context, state) => const AddPhoneNumber(),
      ),
      GoRoute(
        path: AddNameScreen.routePath,
        name: AddNameScreen.routeName,
        builder: (context, state) => const AddNameScreen(),
      ),
      GoRoute(
        path: VerificationCodePage.routePath,
        name: VerificationCodePage.routeName,
        builder: (context, state) => const VerificationCodePage(),
      ),
      GoRoute(
        path: UploadPhotoScreen.routePath,
        name: UploadPhotoScreen.routeName,
        builder: (context, state) => UploadPhotoScreen(),
      ),
      GoRoute(
        path: HomepageScreen.routePath,
        name: HomepageScreen.routeName,
        builder: (context, state) => const HomepageScreen(),
      ),
      GoRoute(
        path: NewChatTypingScreen.routePath,
        name: NewChatTypingScreen.routeName,
        builder: (context, state) => const NewChatTypingScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      theme: ThemeData(
        fontFamily: AppData.fontFamily,
        primarySwatch: AppColors.primary,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          elevation: 0,
          // backgroundColor: ,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.nuetral[900],
          ),
          headline2: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.nuetral[300],
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.nuetral[600],
          ),
          headline3: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.nuetral[600],
          ),
          caption: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.nuetral[600],
          ),
        ),
      ),
    );
  }
}
