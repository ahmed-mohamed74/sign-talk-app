import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_talk_app/controllers/data_controller.dart';

import 'package:sign_talk_app/core/utils/AppRouter.dart';
import 'package:sign_talk_app/models/drawer_item_model.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

//   BuildContext get context;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Icon(Icons.sign_language, size: 50)),
          DrawerItem(
            title: 'Home',
            icon: Icons.home,
            location: AppRouter.kHomeView,
          ),
          DrawerItem(
            title: 'My Profile',
            icon: Icons.perm_identity,
            location: AppRouter.kSelectProfile,
          ),
          DrawerItem(
            title: 'Tutorial',
            icon: Icons.history_edu,
            location: AppRouter.kSearchForDevice,
          ),
          DrawerItem(
            title: 'Update Words',
            icon: Icons.edit,
            location: AppRouter.kEditWords,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Setting & Preferences',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
          /*DrawerItem(
            title: 'Notification',
            icon: Icons.notification_add,
            location: AppRouter.kSearchForDevice,
          ),*/
          DrawerItem(
            title: 'Language',
            icon: Icons.translate_outlined,
            location: AppRouter.kChooseLanguage,
          ),
          DrawerItem(
            title: 'Dark mode',
            icon: Icons.dark_mode,
            location: AppRouter.kSearchForDevice,
            trailingIcon: Icons.toggle_on_sharp,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Support',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
          DrawerItem(
            title: 'Help Center',
            icon: Icons.message_outlined,
            location: AppRouter.kSearchForDevice,
          ),
          DrawerItem(
            title: 'Report A Bug',
            icon: Icons.flag_outlined,
            location: AppRouter.kSearchForDevice,
          ),
          DrawerItem(
            title: 'Log Out',
            icon: Icons.logout,
            location: AppRouter.kSearchForDevice,
            iconColor: Colors.red,
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.location,
    this.iconColor,
    this.textColor,
    this.trailingIcon,
  });

  final String title;
  final IconData icon;
  final String location;
  bool isSelected = false;
  Color? iconColor = Colors.black;
  Color? textColor = Colors.black;
  IconData? trailingIcon = Icons.toggle_on_sharp;

  @override
  Widget build(BuildContext context) {
    final DataController controller = DataController();
    isSelected = controller.selectedDrawerPage == title;

    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(30),
            topEnd: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? const Color(0xFF4CB6BD).withOpacity(0.5)
                  : Colors.transparent,
              spreadRadius: 1,
            ),
          ]),
      child: ListTile(
        iconColor: iconColor,
        onTap: () {
          controller.selectedDrawerPage = title;
          GoRouter.of(context).push(location);
        },
        leading: Icon(icon),
        trailing: trailingIcon != null ? Icon(trailingIcon) : null,
        title: Text(
          title,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
