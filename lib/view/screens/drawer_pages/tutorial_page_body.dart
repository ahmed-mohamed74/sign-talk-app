import 'package:flutter/material.dart';

import '../../widgets/curved_container.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> tutorialTexts = [
    "Here, you'll learn the basics of sign language.",
    "This Gesture represent : ",
    "This Gesture represent : ",
    "This Gesture represent : ",
    "This Gesture represent : ",
    "This Gesture represent : ",
    "This Gesture represent : ",
    "This Gesture represent : ",
    "This Gesture represent : ",
    "This Gesture represent : ",
    "This Gesture represent : ",
    "This Gesture represent : ",
    "This Gesture represent : ",
  ];

  final List<String> tutorialImages = [
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",
    "assets/images/sign-talk.png",

  ];

  final List<String> tutorialGuideTexts = [
    "Swipe left to see more tutorial pages.",
    " I Need Water ",
    " I Need Water ",
    " I Need Water ",
    " I Need Water ",
    " I Need Water ",
    " I Need Water ",
    " I Need Water ",
    " I Need Water ",
    " I Need Water ",
    " I Need Water ",
    " I Need Water ",
    " I Need Water ",


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text("Welcome to our sign language app",style: TextStyle(color: Color(0xff39a6b0)),),
        centerTitle: true,
      ),*/
      body: Column(
        children: [
          CurvedBottomContainer(
            press: () => Navigator.pop(context), // Simplified navigation
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: tutorialTexts.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return TutorialPageItem(
                  text: tutorialTexts[index],
                  image: tutorialImages[index],
                  guideText: tutorialGuideTexts[index],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Page ${_currentPage + 1} of ${tutorialTexts.length}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TutorialPageItem extends StatelessWidget {
  final String text;
  final String image;
  final String guideText;

  const TutorialPageItem({super.key, required this.text, required this.image, required this.guideText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 200, // Adjust as needed
        ),
        const SizedBox(height: 20),
        Text(
          text,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          guideText,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}