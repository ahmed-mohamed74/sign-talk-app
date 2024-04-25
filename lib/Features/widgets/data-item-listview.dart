import 'package:flutter/material.dart';
import 'package:sign_talk_app/Features/widgets/data-item.dart';

class DataItemListView extends StatelessWidget {
  const DataItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: DataItem(),
            );
          }),
    );
  }
}
