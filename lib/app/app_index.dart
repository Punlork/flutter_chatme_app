import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chatme_app/app/logic/cubit/button_index_cubit.dart';
import 'package:flutter_chatme_app/app/logic/cubit/index_page_cubit.dart';
import 'package:flutter_chatme_app/app/views/pages/add_name/add_name_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/add_phone_number/add_phone_number.dart';
import 'package:flutter_chatme_app/app/views/pages/home/group/deail_group/detail_group_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/group/group_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/group/photos/group_photo.dart';
import 'package:flutter_chatme_app/app/views/pages/home/homepage_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/new_chat/new_chat_typing_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/new_contact/new_contact_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/profile_detail/profiel_detail_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/appearance/appearance_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/date_storage/data_storage_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/date_storage/manage_storage/manage_storage_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/date_storage/photos/photos_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/edit_profile/edit_profile_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/faq/faq_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/last_call/last_call_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/privacy/privacy_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/privacy/screens/blocked_contact/blocked_contact_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/privacy/screens/last_seen/last_seen_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/qr_code/qr_code_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/setting_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/star_message/star_message_screen.dart';
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
        builder: (context, state) => HomepageScreen(),
      ),
      GoRoute(
        path: NewChatTypingScreen.routePath,
        name: NewChatTypingScreen.routeName,
        builder: (context, state) => const NewChatTypingScreen(),
      ),
      GoRoute(
        path: NewContactScreen.routePath,
        name: NewContactScreen.routeName,
        builder: (context, state) => NewContactScreen(),
      ),
      GoRoute(
        path: SettingScreen.routePath,
        name: SettingScreen.routeName,
        builder: (context, state) => SettingScreen(),
      ),
      GoRoute(
        path: EditProfileScreen.routePath,
        name: EditProfileScreen.routeName,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: QrCodeScreen.routePath,
        name: QrCodeScreen.routeName,
        builder: (context, state) => QrCodeScreen(),
      ),
      GoRoute(
        path: StarMessageScreen.routePath,
        name: StarMessageScreen.routeName,
        builder: (context, state) => StarMessageScreen(),
      ),
      GoRoute(
        path: LastCallScreen.routePath,
        name: LastCallScreen.routeName,
        builder: (context, state) => LastCallScreen(),
      ),
      GoRoute(
        path: AppearanceScreen.routePath,
        name: AppearanceScreen.routeName,
        builder: (context, state) => AppearanceScreen(),
      ),
      GoRoute(
        path: PrivacyScreen.routePath,
        name: PrivacyScreen.routeName,
        builder: (context, state) => PrivacyScreen(),
      ),
      GoRoute(
        path: LastSeenScreen.routePath,
        name: LastSeenScreen.routeName,
        builder: (context, state) => LastSeenScreen(),
      ),
      GoRoute(
        path: BlockedContactScreen.routePath,
        name: BlockedContactScreen.routeName,
        builder: (context, state) => BlockedContactScreen(),
      ),
      GoRoute(
        path: DataStorageScreen.routePath,
        name: DataStorageScreen.routeName,
        builder: (context, state) => DataStorageScreen(),
      ),
      GoRoute(
        path: ManageStorageScreen.routePath,
        name: ManageStorageScreen.routeName,
        builder: (context, state) => ManageStorageScreen(),
      ),
      GoRoute(
        path: PhotosScreen.routePath,
        name: PhotosScreen.routeName,
        builder: (context, state) => PhotosScreen(),
      ),
      GoRoute(
        path: FAQScreen.routePath,
        name: FAQScreen.routeName,
        builder: (context, state) => FAQScreen(),
      ),
      GoRoute(
        path: GroupScreen.routePath,
        name: GroupScreen.routeName,
        builder: (context, state) => GroupScreen(),
      ),
      GoRoute(
        path: DetailGroupScreen.routePath,
        name: DetailGroupScreen.routeName,
        builder: (context, state) => DetailGroupScreen(),
      ),
      GoRoute(
        path: GroupPhotoScreen.routePath,
        name: GroupPhotoScreen.routeName,
        builder: (context, state) => GroupPhotoScreen(),
      ),
      GoRoute(
        path: ProfileDetailScreen.routePath,
        name: ProfileDetailScreen.routeName,
        builder: (context, state) => ProfileDetailScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => IndexPageCubit(),
        ),
        BlocProvider(
          create: (context) => ButtonIndexCubit(),
        ),
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}
