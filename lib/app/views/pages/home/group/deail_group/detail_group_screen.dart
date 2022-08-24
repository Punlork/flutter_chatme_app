import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class DetailGroupScreen extends StatelessWidget {
  const DetailGroupScreen({Key? key}) : super(key: key);

  static const String routePath = '/detail_group_screen';
  static const String routeName = 'detail_group_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/image-7.png',
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: AppData.appPadding, vertical: 20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Work Team',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
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
                Text(
                  'Descriptions',
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: 10),
                Text(
                  'Massa massa, ultrices morbi tortor et in cursus ultrices sem dignissim nunc, tortor aenean aliquet faucibus habitasse ris... Read more',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          Divider(thickness: 7),
          const SizedBox(height: 10),
          GroupComponent(
            icon: Icons.photo_outlined,
            title: '2238 Photos',
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
          ),
          const SizedBox(height: 10),
          GroupComponent(
            icon: Icons.link_outlined,
            title: '19 shared links',
          ),
          const SizedBox(height: 10),
          Divider(thickness: 7),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppData.appPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('256 members'),
                    Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.nuetral[300],
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.person_add_alt_1_outlined,
                          color: AppColors.nuetral[300],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Arlene McCoy'),
                        const SizedBox(height: 5),
                        Text(
                          'Online',
                          style: TextStyle(
                            color: AppColors.primary[400],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GroupComponent extends StatelessWidget {
  const GroupComponent({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppData.appPadding),
      child: Column(
        children: [
          Row(
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
              Icon(
                Icons.navigate_next,
                color: AppColors.nuetral[300],
              )
            ],
          ),
        ],
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
