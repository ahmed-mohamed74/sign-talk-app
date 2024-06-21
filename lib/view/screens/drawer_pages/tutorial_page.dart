import 'package:flutter/material.dart';

import '../../widgets/curved_container.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> tutorialTexts = [
    "Here, you'll learn our sign talk app moves.",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
    "This Gesture represents : ",
  ];

  final List<String> tutorialImages = [
    "assets/tutorial/0.png",
    "assets/tutorial/1.png",
    "assets/tutorial/2.png",
    "assets/tutorial/3.png",
    "assets/tutorial/4.png",
    "assets/tutorial/5.png",
    "assets/tutorial/6.png",
    "assets/tutorial/7.png",
    "assets/tutorial/8.png",
    "assets/tutorial/9.png",
    "assets/tutorial/10.png",
    "assets/tutorial/11.png",
    "assets/tutorial/12.png",
    "assets/tutorial/13.png",
    "assets/tutorial/14.png",
    "assets/tutorial/15.png",
  ];

  final List<String> tutorialGuideTexts = [
    "Swipe left to see more tutorial pages.",
    " Move 1 ",
    " Move 2 ",
    " Move 3 ",
    " Move 4 ",
    " Move 5 ",
    " Move 6 ",
    " Move 7 ",
    " Move 8 ",
    " Move 9 ",
    " Move 10 ",
    " Move 11 ",
    " Move 12 ",
    " Move 13 ",
    " Move 14 ",
    " Move 15 ",


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            style: TextStyle(fontSize: 16,color: Theme.of(context).textTheme.titleLarge!.color),
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 18,color: Theme.of(context).textTheme.titleLarge!.color),
            textAlign: TextAlign.center,
          ),
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