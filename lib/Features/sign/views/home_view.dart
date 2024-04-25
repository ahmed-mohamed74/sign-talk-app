import 'package:flutter/material.dart';
import 'package:sign_talk_app/Features/widgets/custom-drawer.dart';
import 'package:sign_talk_app/Features/widgets/data-item-listview.dart';
import 'package:sign_talk_app/Features/widgets/method-item-listview.dart';
import 'package:sign_talk_app/core/utils/assets.dart';

import '../../../controllers/data_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final DataController _controller = DataController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Image.asset(AssetsData.slider)),
          actions: [
            Image.asset(
              AssetsData.group,
              height: 5,
            ),
          ],
          backgroundColor: const Color(0xffFAFAFA),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff4CB6BD),
          child: const Icon(
            Icons.keyboard_voice_outlined,
            size: 30,
            color: Colors.white,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.5),
              child: Text(
                'Hey Mohamed,',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.toggle_off,
                  color: Colors.grey,
                  size: 80,
                ),
                Text(
                  'Start listening',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2,
            ),
            MethodItemListview(),
            SizedBox(
              height: 15,
            ),
            DataItemListView(),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              _controller.gloveText,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            )),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
