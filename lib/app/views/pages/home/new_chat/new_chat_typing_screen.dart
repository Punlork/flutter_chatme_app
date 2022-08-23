import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class NewChatTypingScreen extends StatelessWidget {
  const NewChatTypingScreen({super.key});

  static const String routePath = '/new_chat_typing';
  static const String routeName = 'new_chat_typing';

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
              height: MediaQuery.of(context).size.height * 0.35,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 150),
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
                    child: Image.asset('assets/images/Group 1073.png'),
                  ),
                  const CustomNewChatTypingOptions(
                    icon: Icons.photo_size_select_actual_rounded,
                    title: 'Photo or Gallary',
                  ),
                  const CustomNewChatTypingOptions(
                    icon: Icons.document_scanner_outlined,
                    title: 'Document',
                  ),
                  const CustomNewChatTypingOptions(
                    icon: Icons.location_on,
                    title: 'Location',
                  ),
                  const CustomNewChatTypingOptions(
                    icon: Icons.person_pin,
                    title: 'Contact',
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: AppColors.primary[50],
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            color: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.navigate_before),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Keanu Murphy',
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                    Text(
                      'Active 5 minutes ago',
                      style: TextStyle(color: AppColors.white, fontSize: 16),
                    ),
                  ],
                ),
                const Icon(Icons.videocam),
                const Icon(Icons.call)
              ],
            ),
          ),
        ],
      ),
      bottomSheet: ColoredBox(
        color: AppColors.primary[50]!,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          padding: const EdgeInsets.symmetric(
            horizontal: AppData.appPadding,
            vertical: 16,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: AppData.appPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
              icon: IconButton(
                icon: const Icon(Icons.add_link),
                onPressed: () {
                  showCustomDialog(context);
                },
              ),
              suffixIcon: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: const Icon(
                  Icons.send,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNewChatTypingOptions extends StatelessWidget {
  const CustomNewChatTypingOptions({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.primary,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
