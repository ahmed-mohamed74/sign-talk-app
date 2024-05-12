import 'package:flutter/material.dart';
import 'package:sign_talk_app/view/widgets/method-item.dart';
import 'package:sign_talk_app/core/utils/constants.dart';

import '../../controllers/data_controller.dart';

class MethodItemListview extends StatelessWidget {
  const MethodItemListview({super.key, required this.controller});
  final DataController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(left: 26.0),
        child: ListView.builder(
            itemCount: modes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: MethodItem(
                  modeText: modes[index],
                  index: index,
                ),
              );
            }),
      ),
    );
  }
}
