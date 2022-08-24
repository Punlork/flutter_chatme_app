import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/star_message/models/star_message_model.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class StarMessageScreen extends StatelessWidget {
  StarMessageScreen({Key? key}) : super(key: key) {
    _starMessage = [
      StarMessageModel(
        name: 'Bianne Russell',
        message: 'Orci maecenas hendrerit mattis consectetur. Mauris.',
        date: '21/07/2021',
        time: '15:46',
      ),
      StarMessageModel(
        name: 'Annie Miles',
        message: 'Orci maecenas hendrerit mattis consectetur. Mauris.',
        date: '22/07/2021',
        time: '19:40',
      ),
      StarMessageModel(
        name: 'Bianne Russell',
        message: 'Egestas interdum orci commodo faucibus pretium, neque etiam',
        date: '21/07/2021',
        time: '18:23',
      ),
      StarMessageModel(
        name: 'Annie Miles',
        message: 'Orci maecenas hendrerit mattis consectetur. Mauris.',
        date: '21/07/2021',
        time: '19:40',
      ),
    ];
  }

  static const String routePath = '/star_message_screen';
  static const String routeName = 'star_message_screen';

  late final List<StarMessageModel> _starMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              color: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: AppData.appPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(
                      Icons.navigate_before,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Star Messages',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: AppColors.white,
                    size: 30,
                  )
                ],
              ),
            ),
            ...List.generate(_starMessage.length, (index) {
              return CustomStarMessage(
                starMessage: _starMessage[index],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CustomStarMessage extends StatelessWidget {
  const CustomStarMessage({
    Key? key,
    required this.starMessage,
  }) : super(key: key);

  final StarMessageModel starMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppData.appPadding),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary[50],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 300,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          starMessage.message,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8.0,
                          right: 10,
                        ),
                        child: Icon(
                          Icons.star,
                          color: Colors.orange[500],
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 20),
                  Text(starMessage.time),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(starMessage.name),
                ],
              ),
              Row(
                children: [
                  Text(starMessage.date),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.navigate_next,
                    color: AppColors.nuetral[300],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
