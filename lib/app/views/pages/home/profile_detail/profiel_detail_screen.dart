import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/group/photos/group_photo.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  static const String routePath = '/profile_detail_screen';
  static const String routeName = 'profile_detail_screen';

  @override
  Widget build(BuildContext context) {
    final double circleIcon = 80.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/man.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppData.appPadding, vertical: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Work Team',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Last seen 24 minutes ago',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: circleIcon / 0.3, right: 40),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: circleIcon,
                        height: circleIcon,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.chat,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: AppData.appPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailScreenIcons(
                        icon: Icons.navigate_before,
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                      Row(
                        children: [
                          DetailScreenIcons(
                            icon: Icons.search,
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          DetailScreenIcons(
                            icon: Icons.qr_code,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppData.appPadding,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileDetailComponent(
                    title: '+61-123-753-555',
                    subtitle: 'Phone number',
                  ),
                  const SizedBox(height: 10),
                  ProfileDetailComponent(
                    title: 'Busy🔥',
                    subtitle: 'Description',
                  ),
                ],
              ),
            ),
            Divider(thickness: 7),
            const SizedBox(height: 10),
            GroupComponent(
              icon: Icons.photo_outlined,
              title: '2238 Photos',
              onPressed: () {
                GoRouter.of(context).pushNamed(GroupPhotoScreen.routeName);
              },
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppData.appPadding,
                vertical: 10,
              ),
              width: double.infinity,
              child: Image.asset(
                'assets/images/groups.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            GroupComponent(
              icon: Icons.star_border_purple500_outlined,
              title: '43 star messages',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            GroupComponent(
              icon: Icons.link_outlined,
              title: '19 shared links',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            GroupComponent(
              icon: Icons.volume_up,
              trailingIcon: Switch(
                value: true,
                onChanged: (value) {},
              ),
              title: 'Notifications',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Divider(thickness: 7),
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppData.appPadding),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.disabled_by_default_outlined,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Block Contact',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileDetailComponent extends StatelessWidget {
  const ProfileDetailComponent({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

class GroupComponent extends StatelessWidget {
  const GroupComponent({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.trailingIcon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppData.appPadding),
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 10),
                Text(title),
              ],
            ),
            trailingIcon ??
                Icon(
                  Icons.navigate_next,
                  color: AppColors.nuetral[300],
                )
          ],
        ),
      ),
    );
  }
}

class DetailScreenIcons extends StatelessWidget {
  const DetailScreenIcons({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withOpacity(0.5),
      ),
      child: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: Icon(icon),
      ),
    );
  }
}
