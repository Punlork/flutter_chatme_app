import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/settings/last_call/models/last_call_model.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class LastCallScreen extends StatelessWidget {
  LastCallScreen({Key? key}) : super(key: key) {
    _todayLastCall = [
      LastCallModel(
        name: 'Annie Miles',
        callStatus: 'Incoming',
        time: '10:30 PM',
      ),
      LastCallModel(
        name: 'Wade Warren',
        callStatus: 'Outgoing',
        time: '10:00 PM',
      ),
      LastCallModel(
        name: 'Guy Hawkins',
        callStatus: 'Missed Call',
        time: '08:32 PM',
      ),
    ];
    _yesterdayLastCall = [
      LastCallModel(
        name: 'Robert Fox',
        callStatus: 'Outgoing',
        time: '11:11 PM',
      ),
      LastCallModel(
        name: 'Savannah Nguyen',
        callStatus: 'Incoming',
        time: '10:22 PM',
      ),
      LastCallModel(
        name: 'Albet Flores',
        callStatus: 'Outgoing ',
        time: '10:10 PM',
      ),
      LastCallModel(
        name: 'Annette Black',
        callStatus: 'Incoming ',
        time: '09:31 PM',
      ),
      LastCallModel(
        name: 'Floyd Miles',
        callStatus: 'Outgoing ',
        time: '09:00 PM',
      ),
      LastCallModel(
        name: 'Kathryn Murphy',
        callStatus: 'Incoming ',
        time: '08:21 PM',
      ),
    ];
  }

  static const String routePath = '/last_call_screen';
  static const String routeName = 'last_call_screen';

  late final List<LastCallModel> _todayLastCall;
  late final List<LastCallModel> _yesterdayLastCall;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              color: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: AppData.appPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(Icons.navigate_before),
                    iconSize: 30,
                    color: AppColors.white,
                  ),
                  Text(
                    'Last Call',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 30,
                    ),
                    color: AppColors.white,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppData.appPadding,
                vertical: 30,
              ),
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LastCall(lastCall: _todayLastCall),
                      LastCall(lastCall: _yesterdayLastCall),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LastCall extends StatelessWidget {
  const LastCall({
    Key? key,
    required List<LastCallModel> lastCall,
  })  : _tLastCall = lastCall,
        super(key: key);

  final List<LastCallModel> _tLastCall;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _tLastCall.length > 3 ? 'Yesterday' : 'TODAY',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.nuetral[300],
          ),
        ),
        const SizedBox(height: 10),
        ...List.generate(
          _tLastCall.length,
          (index) {
            final _call = _tLastCall[index];
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _call.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.nuetral[900],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    _call.phoneIcon,
                                    color: AppColors.nuetral[300],
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    _call.callStatus,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.nuetral[300],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _call.time,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(width: 20),
                          Icon(
                            _call.detailIcon,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider()
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
