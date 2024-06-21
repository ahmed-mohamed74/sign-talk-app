import 'package:flutter/material.dart';

import '../../widgets/curved_container.dart';

class SelectProfile extends StatelessWidget {
  const SelectProfile(
      {super.key,
      required this.userName,
      required this.userEmail,
      required this.userId});

  final String userName;
  final String userEmail;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          CurvedBottomContainer(
            press: () {
              Navigator.pop(context);
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 120),
            child: Center(
              child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/Group.png'),
                  backgroundColor: Colors.white),
            ),
          )
        ]),
        const SizedBox(
          height: 5,
        ),
        Text(
          userName,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListItem(
                  text: 'E-mail', icon: Icons.email_rounded, mail: userEmail),
              const SizedBox(height: 10),
              const ListItem(
                  text: 'Phone', icon: Icons.phone, mail: '01012345678'),
              const SizedBox(height: 10),
              ListItem(
                  text: 'User ID',
                  icon: Icons.verified_user_outlined,
                  mail: userId),
            ],
          ),
        )
      ],
    ));
  }
}

class ListItem extends StatelessWidget {
  const ListItem(
      {super.key, required this.text, required this.icon, required this.mail});

  final String text;
  final IconData icon;
  final String mail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xffE9F4FA),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                // SizedBox(width: 10,),
                Icon(
                  icon,
                  color: Colors.black,
                ),
                const SizedBox(width: 40),
                Expanded(
                  flex: 5,
                  child: Text(
                    mail,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2, // Limit to one line if desired
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                // SizedBox(width: 10,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
