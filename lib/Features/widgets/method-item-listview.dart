import 'package:flutter/material.dart';
import 'package:sign_talk_app/Features/sign/views/method-item.dart';

class MethodItemListview extends StatelessWidget {
  const MethodItemListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: index == 0
                    ? const MethodItem(isActive: true)
                    : const MethodItem(isActive: false),
              );
            }),
      ),
    );
  }
}
