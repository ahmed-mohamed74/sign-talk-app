import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_talk_app/view/screens/drawer_pages/select-profile.dart';
import 'package:sign_talk_app/view/widgets/custom-drawer.dart';
import 'package:sign_talk_app/core/utils/assets.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../controllers/data_controller.dart';
import 'package:provider/provider.dart';
import '../../controllers/sensor_controller.dart';
import '../../core/utils/AppRouter.dart';
import '../../core/utils/constants.dart';
import '../widgets/data-item.dart';
import '../widgets/method-item-listview.dart';

class HomeView extends StatefulWidget {
  HomeView({required this.user, super.key});

  UserCredential? user;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final FlutterTts _flutterTts = FlutterTts();
  Map? _currentVoice;

  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordsSpoken = '';
  double _confidence = 0;

  @override
  void initState() {
    super.initState();
    initTTS();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _confidence = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
      _confidence = result.confidence;
    });
  }

  void initTTS() {
    _flutterTts.getVoices.then((data) {
      try {
        List<Map> _voices = List<Map>.from(data);
        _voices.where((_voice) => _voice["name"].contains("en")).toList();
        setState(() {
          _currentVoice = _voices.first;
          setVoice(_currentVoice!);
        });
      } catch (e) {
        print(e);
      }
    });
  }

  void setVoice(Map voice) {
    _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(milliseconds: 300));
    GoRouter.of(context).pop();
    GoRouter.of(context)
        .push(AppRouter.kHomeView, extra: widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DataController, SensorController>(
      builder: (context, dataController, sensorController, _) {
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
                  color: Theme.of(context).appBarTheme.foregroundColor,
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.person_outline_outlined,
                    size: 40,
                  ),
                  onPressed: () {
                    print(widget.user?.user?.email ?? 'no email');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectProfile(
                            userEmail: widget.user?.user?.email ?? 'emal@email',
                            userName: widget.user?.user?.displayName ?? 'name',
                            userId: widget.user?.user?.uid ?? 'Not Found',
                          ),
                        ));
                  },
                ),
              ),
            ],
            elevation: 0,
          ),
          body: RefreshIndicator(
            onRefresh: _handleRefresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.5),
                    child: Text(
                      'Hi ${widget.user?.user?.displayName ?? 'User'},',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.titleLarge?.color ??
                            kPrimaryColor,
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
                          value: dataController.startListenToAPI,
                          padding: 6.0,
                          activeColor: kPrimaryColor,
                          showOnOff: false,
                          onToggle: (value) {
                            setState(() {
                              dataController.startListenToAPI = value;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(dataController.startListenToAPI
                            ? 'stop listening'
                            : "start listening"),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1.4),
                  MethodItemListview(controller: dataController),
                  const SizedBox(height: 50),
                  dataController.startListenToAPI
                      ? SizedBox(
                          height: 300,
                          child: Column(
                            children: [
                              DataItem(
                                flutterTts: _flutterTts,
                                upperText: 'Move your hand, please!',
                                color: Theme.of(context).primaryColor,
                                innerText: sensorController.gloveText,
                              ),
                              DataItem(
                                flutterTts: _flutterTts,
                                upperText: _speechToText.isListening
                                    ? 'listening...'
                                    : _speechEnabled
                                        ? 'Tap the mic to start listening... '
                                        : 'Speech not available',
                                color: Colors.red,
                                innerText: _wordsSpoken,
                              ),
                              if (_speechToText.isNotListening &&
                                  _confidence > 0)
                                Center(
                                  child: Text(
                                    '${(_confidence * 100).toStringAsFixed(1)}%',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.color ??
                                            kPrimaryColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ),
                            ],
                          ),
                        )
                      : Center(
                          child: SizedBox(
                            height: 365,
                            child: Lottie.asset(
                                'assets/Animated_glove _image.json'),
                          ),
                        ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Listen',
            onPressed:
                _speechToText.isListening ? _stopListening : _startListening,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              _speechToText.isNotListening
                  ? Icons.mic_off
                  : Icons.keyboard_voice_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
