import 'package:flutter/material.dart';

import 'curved_container.dart';

class SelectProfile extends StatelessWidget {
  const SelectProfile({super.key});

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
        const Text(
          'shadan khalid',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListItem(
                  text: 'E-mail',
                  icon: Icons.email_rounded,
                  mail: 'Shadan_Khalid18@gmail.com'),
              SizedBox(
                height: 10,
              ),
              ListItem(text: 'Phone', icon: Icons.phone, mail: '01018517555'),
              SizedBox(
                height: 10,
              ),
              ListItem(text: 'Password', icon: Icons.lock, mail: 'om12***09yu'),
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
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(
          height: 4,
        ),
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
                Icon(icon),
                const SizedBox(
                  width: 40,
                ),
                Text(
                  mail,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(Icons.settings),
                // SizedBox(width: 10,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
