

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sign_talk_app/core/utils/AppRouter.dart';
import 'package:sign_talk_app/models/drawer_item_model.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

//   BuildContext get context;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  /*List<DrawerItem> items = [
    DrawerItemModel(
      title: 'My Profile',
      icon: Icons.perm_identity,
      onTap: () => GoRouter.of(context).push(AppRouter.kMyProfile),
    ),
    DrawerItemModel(title: 'Devices', icon: Icons.device_unknown, onTap: () {
          () => GoRouter.of(context).push(AppRouter.kSearchForDevice);
    }),
    DrawerItemModel(title: 'Tutorial', icon: Icons.history_edu, onTap: () {}),
    DrawerItemModel(
        title: 'Overview', icon: Icons.interests_outlined, onTap: () {}),
  ];*/

  List<DrawerItem> items = [
    const DrawerItem(
        title: 'My Profile',
        icon: Icons.perm_identity,
        location: AppRouter.kMyProfile),
    const DrawerItem(
        title: 'Devices',
        icon: Icons.device_unknown,
        location: AppRouter.kSearchForDevice),
    const DrawerItem(
        title: 'Tutorial',
        icon: Icons.history_edu,
        location: AppRouter.kSearchForDevice),
    const DrawerItem(
        title: 'Overview',
        icon: Icons.interests_outlined,
        location: AppRouter.kSearchForDevice),
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffDBDBDB),
      child: Column(
        children: [
          const DrawerHeader(
              child: Icon(
            Icons.sign_language,
            size: 48,
          )),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return items[index];
              }),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.location});

  final String title;
  final IconData icon;
  final String location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(location);
      },
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
      ),
    );
  }
}
