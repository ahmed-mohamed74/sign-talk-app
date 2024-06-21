import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sign_talk_app/controllers/data_controller.dart';

import 'package:sign_talk_app/core/utils/AppRouter.dart';

import '../../core/utils/constants.dart';
import '../../controllers/theme_provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

//   BuildContext get context;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Icon(Icons.sign_language, size: 50)),
          DrawerItem(
              title: 'Home',
              textColor: Theme.of(context).textTheme.titleLarge!.color,
              iconColor: Theme.of(context).textTheme.titleLarge!.color,
              icon: Icons.home),
          DrawerItem(
            title: 'Tutorial',
            icon: Icons.history_edu,
            location: AppRouter.kTutorialPage,
            textColor: Theme.of(context).textTheme.titleLarge!.color,
            iconColor: Theme.of(context).textTheme.titleLarge!.color,
          ),
          DrawerItem(
            title: 'Update Words',
            icon: Icons.edit,
            location: AppRouter.kEditWords,
            textColor: Theme.of(context).textTheme.titleLarge!.color,
            iconColor: Theme.of(context).textTheme.titleLarge!.color,
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
            textColor: Theme.of(context).textTheme.titleLarge!.color,
            iconColor: Theme.of(context).textTheme.titleLarge!.color,
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(30),
                  topEnd: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.transparent,
                    spreadRadius: 1,
                  ),
                ]),
            child: ListTile(
              enabled: false,
              //iconColor: Colors.black,
              onTap: () {},
              leading: Icon(
                Icons.dark_mode,
                color: Theme.of(context).textTheme.titleLarge!.color,
              ),
              trailing: SizedBox(
                width: 45,
                height: 25,
                child: FlutterSwitch(
                  value: themeProvider.isDarkMode,
                  //padding: 6.0,
                  activeColor: kPrimaryColor,
                  showOnOff: false,
                  onToggle: (value) {
                    themeProvider.toggleTheme(value);
                  },
                ),
              ),
              title: Text(
                'Dark mode',
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleLarge!.color),
              ),
            ),
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
            location: AppRouter.kHelpCenterPage,
            textColor: Theme.of(context).textTheme.titleLarge!.color,
            iconColor: Theme.of(context).textTheme.titleLarge!.color,
          ),
          DrawerItem(
            title: 'Report A Bug',
            icon: Icons.flag_outlined,
            location: AppRouter.kBugReportPage,
            textColor: Theme.of(context).textTheme.titleLarge!.color,
            iconColor: Theme.of(context).textTheme.titleLarge!.color,
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
    this.location,
    this.iconColor,
    this.textColor,
    this.trailingIcon,
  });

  final String title;
  final IconData icon;
  String? location;
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
                  ? kPrimaryColor.withOpacity(0.5)
                  : Colors.transparent,
              spreadRadius: 1,
            ),
          ]),
      child: ListTile(
        iconColor: iconColor,
        onTap: () {
          controller.selectedDrawerPage = title;
          location != null
              ? GoRouter.of(context).push(location!)
              : GoRouter.of(context).pop();
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
