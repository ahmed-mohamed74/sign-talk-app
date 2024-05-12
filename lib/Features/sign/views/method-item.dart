import 'package:flutter/material.dart';
import 'package:sign_talk_app/controllers/data_controller.dart';
import 'package:provider/provider.dart';

class MethodItem extends StatelessWidget {
  const MethodItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataController>(
      builder: (context, controller, _) {
        return Container(
          width: 80,
          height: 30,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: controller.gloveMode == index
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor.withOpacity(0.7),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  controller.changeGloveMode(index);
                },
                child: const Text(
                  'School',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
