// ignore_for_file: inference_failure_on_function_invocation

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chatme_app/app/views/pages/home/models/new_chat.dart';
import 'package:flutter_chatme_app/app/views/pages/home/new_chat/new_chat_typing_screen.dart';
import 'package:flutter_chatme_app/app/views/pages/home/new_contact/new_contact_screen.dart';
import 'package:flutter_chatme_app/app/views/widgets/custom_button.dart';
import 'package:flutter_chatme_app/common/app_colors.dart';
import 'package:flutter_chatme_app/common/app_data.dart';
import 'package:go_router/go_router.dart';

class CustomHomeScreenFloatingButton extends StatelessWidget {
  CustomHomeScreenFloatingButton({
    super.key,
  }) {
    _newGroup = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppData.appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text('Add participants'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppData.appPadding,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.divider,
                ),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search Poeple',
                  icon: Icon(Icons.search_outlined),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          width: 70,
                          margin: const EdgeInsets.all(
                            AppData.appPadding,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Text(index.toString()),
                    ],
                  );
                },
                shrinkWrap: true,
                itemCount: 20,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(title: 'Next', onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(AppData.appPadding),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text('New Group'),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: AppColors.divider,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.camera_alt_sharp,
                  size: 40,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const CustomNewContactTextField(
              title: 'Name of group',
              hintText: 'Name group',
              iconData: null,
            ),
            const SizedBox(height: 20),
            const CustomNewContactTextField(
              title: 'Description (Optional)',
              hintText: 'Type description',
              iconData: null,
            ),
            const SizedBox(height: 20),
            CustomButton(title: 'Next', onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ];
    _contact = [
      FindContactModel(name: 'Annette Black', phoneNumber: '+61-827-680-673'),
      FindContactModel(name: 'Arlene McCoy', phoneNumber: '+61-827-680-673'),
      FindContactModel(name: 'Bourtney Henry', phoneNumber: '+61-827-680-673'),
      FindContactModel(name: 'Bianne Russell', phoneNumber: '+61-827-680-673'),
      FindContactModel(name: 'Bessie Cooper', phoneNumber: '+61-827-680-673'),
      FindContactModel(name: 'Bessie Cooper', phoneNumber: '+61-827-680-673'),
      FindContactModel(name: 'Annie Miles', phoneNumber: '+61-827-680-673'),
    ];
  }

  late final List<Widget> _newGroup;
  late final List<FindContactModel> _contact;

  @override
  Widget build(BuildContext context) {
    void customButtonSheet(BuildContext context) {
      final _sortAContact = _contact
          .where((element) => element.name[0].toLowerCase().contains('a'))
          .toList();
      final _sortBContact = _contact
          .where((element) => element.name[0].toLowerCase().contains('b'))
          .toList();
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Wrap(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(
                          'Contact',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(
                            horizontal: AppData.appPadding,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.divider),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.search,
                                color: AppColors.nuetral[300],
                              ),
                              hintText: 'Search chat, people and more...',
                              hintStyle: const TextStyle(
                                color: AppColors.divider,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ContactCategory(sortAContact: _sortAContact),
                        ContactCategory(sortAContact: _sortBContact),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    void showNewGroup(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
            child: PageView.builder(
              itemBuilder: (context, index) {
                return _newGroup[index];
              },
              itemCount: _newGroup.length,
            ),
          );
        },
      );
    }

    void showCustomDialog(BuildContext context) {
      showGeneralDialog(
        context: context,
        barrierLabel: 'Barrier',
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomHomeScreenOptions(
                title: 'New Chat',
                icon: Icons.chat_sharp,
                onPressed: () {
                  customButtonSheet(context);
                },
              ),
              CustomHomeScreenOptions(
                title: 'New Contact',
                icon: Icons.person_pin,
                onPressed: () {
                  GoRouter.of(context).pushNamed(NewContactScreen.routeName);
                },
              ),
              CustomHomeScreenOptions(
                title: 'New Group',
                icon: Icons.people_alt,
                onPressed: () {
                  showNewGroup(context);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            ],
          );
        },
      );
    }

    return FloatingActionButton(
      onPressed: () {
        showCustomDialog(context);
      },
      elevation: 0,
      child: Icon(
        Icons.add,
        color: AppColors.white,
      ),
    );
  }
}

class ContactCategory extends StatelessWidget {
  const ContactCategory({
    Key? key,
    required List<FindContactModel> sortAContact,
  })  : _sortAContact = sortAContact,
        super(key: key);

  final List<FindContactModel> _sortAContact;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(NewChatTypingScreen.routeName);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: AppColors.divider,
            height: 32,
            padding: EdgeInsets.symmetric(
              horizontal: AppData.appPadding,
              vertical: 6,
            ),
            child: Text(
              _sortAContact[0].name[0],
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(
            _sortAContact.length,
            (index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppData.appPadding,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _sortAContact[index].name,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _sortAContact[index].phoneNumber,
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: AppColors.nuetral,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomHomeScreenOptions extends StatelessWidget {
  const CustomHomeScreenOptions({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: 180,
        height: 56,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: AppColors.primary,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
