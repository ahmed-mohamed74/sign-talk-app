import 'package:flutter/material.dart';

import '../../curved_container.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CurvedBottomContainer(
            press: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
              child: Text(
            'Choose Language',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 50,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlagItem(
                  image: 'assets/images/flag-for-flag-egypt-svgrepo-com 1.png',
                  text: 'English'),
              SizedBox(
                width: 80,
              ),
              FlagItem(
                  image:
                      'assets/images/flag-for-flag-united-kingdom-svgrepo-com 1.png',
                  text: 'Arabic'),
            ],
          ),
        ],
      ),
    );
  }
}

class FlagItem extends StatelessWidget {
  const FlagItem({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        const SizedBox(
          height: 10,
        ),
        Text(text),
      ],
    );
  }
}
