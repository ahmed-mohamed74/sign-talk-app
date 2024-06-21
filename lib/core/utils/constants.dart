import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF4CB6BD);
const kBackgroundColorL = Colors.white;
const kBackgroundColorD = Colors.black;

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.cyan,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kBackgroundColorL,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white, foregroundColor: Colors.black),
  textTheme:
  const TextTheme(titleLarge: TextStyle(color: Colors.black)),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.white))),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.cyan,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kBackgroundColorD,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black, foregroundColor: Colors.white),
  textTheme:
  const TextTheme(titleLarge: TextStyle(color: Colors.white)),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.white))),
);

List<String> modes = ['Home', 'Hospital', 'Street'];
List<String> words = [
  "hello",
  "welcome",
  "I need medicine.",
  "Waiting…",
  "I'm thirsty.",
  "I'm hungry.",
  "It's too noisy.",
  "I don't like this.",
  "I have a headache.",
  "I want to go out.",
  "Thank you.",
  "I like this.",
  "I need more.",
  "Call The Doctor.",
  "I need less.",
  "Stop."
];
