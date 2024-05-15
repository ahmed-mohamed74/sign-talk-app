import 'package:flutter/material.dart';
import 'package:sign_talk_app/core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0,
        centerTitle: true,
        leading:
           const Icon(Icons.dehaze_rounded),

            ),
        );



  }
}
