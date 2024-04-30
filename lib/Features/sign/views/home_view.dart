import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_talk_app/Features/widgets/custom-drawer.dart';
import 'package:sign_talk_app/Features/widgets/method-item-listview.dart';
import 'package:sign_talk_app/core/utils/assets.dart';

import '../../../controllers/data_controller.dart';
import '../../widgets/data-item.dart';

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
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: Image.asset(
              AssetsData.slider,
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.sign_language,
              size: 40,
              color: Colors.black87,
            ),
          ),
        ],
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.keyboard_voice_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.5),
            child: Text(
              'Hi Mohamed,',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                FlutterSwitch(
                  width: 70,
                  height: 33,
                  value: _controller.startListenToAPI,
                  padding: 6.0,
                  activeColor: const Color(0xFF4CB6BD),
                  showOnOff: false,
                  onToggle: (value) {
                    setState(() {
                      _controller.startListenToAPI = value;
                    });
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(_controller.startListenToAPI
                    ? 'stop listening'
                    : "start listening"),
              ],
            ),
          ),
          const Divider(
            thickness: 1.4,
          ),
          const MethodItemListview(),
          const Spacer(),
          _controller.startListenToAPI
              ? SizedBox(
                  height: 240,
                  child: Column(
                    children: [
                      DataItem(
                        upperText: 'Move your hand, please!',
                        color: Theme.of(context).primaryColor,
                        innerText: _controller.gloveText,
                      ),
                      const Spacer(),
                      DataItem(
                        upperText: 'Others',
                        color: Colors.red,
                        innerText: _controller.gloveText,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: SizedBox(
                    height: 365,
                    child: Lottie.asset('assets/Animated_glove _image.json'),
                    /*const Image(
                      height: 330,
                      width: double.infinity,
                      image: NetworkImage('',
                        'https://st4.depositphotos.com/12229170/26475/v/450/depositphotos_264750432-stock-illustration-goalkeeper-gloves-thin-line-icon.jpg',
                      ),
                    ),*/
                  ),
                ),
          const Spacer(),
          const SizedBox(height: 110),
        ],
      ),
    );
  }
}
