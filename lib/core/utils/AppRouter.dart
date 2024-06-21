import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_talk_app/view/screens/drawer_pages/bug_report_page.dart';
import 'package:sign_talk_app/view/screens/edit_glove_mode/edit_glove_mode.dart';
import 'package:sign_talk_app/view/screens/home_view.dart';
import 'package:sign_talk_app/view/screens/splash/splash-view.dart';
import 'package:sign_talk_app/view/screens/search_for_device/search_for_device.dart';

import '../../view/screens/drawer_pages/help_center.dart';
import '../../view/screens/drawer_pages/tutorial_page.dart';
import '../../view/screens/login_register/sign_in.dart';
import '../../view/screens/login_register/sign_up.dart';
import '../../view/screens/drawer_pages/choose-language.dart';
import '../../view/screens/drawer_pages/select-profile.dart';

abstract class AppRouter {
  static const kSignUpPage = '/SignUpPage';
  static const kSignInPage = '/SignInPage';
  static const kHomeView = '/HomeView';
  static const kSelectProfile = '/SelectProfile';
  static const kSearchForDevice = '/SearchForDevice';
  static const kChooseLanguage = '/chooseLanguage';
  static const kEditWords = '/editWords';
  static const kTutorialPage = '/tutorialPage';
  static const kHelpCenterPage = '/helpCenterPage';
  static const kBugReportPage = '/bugReportPage';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kSignInPage,
        builder: (BuildContext context, GoRouterState state) => SignInPage(),
      ),
      GoRoute(
        path: kSignUpPage,
        builder: (BuildContext context, GoRouterState state) => SignUpPage(),
      ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const SplashView(),
      ),
      GoRoute(
        path: '/HomeView',
        builder: (context, state) => HomeView(user: state.extra as UserCredential?),
      ),
      /*GoRoute(
        path: kSelectProfile,
        builder: (context, state) =>
            SelectProfile(user: state.extra as UserCredential?),
      ),*/
      GoRoute(
        path: kSearchForDevice,
        builder: (BuildContext context, GoRouterState state) =>
            const SearchForDevice(),
      ),
      GoRoute(
        path: kChooseLanguage,
        builder: (BuildContext context, GoRouterState state) =>
            const ChooseLanguage(),
      ),
      GoRoute(
        path: kEditWords,
        builder: (BuildContext context, GoRouterState state) =>
            const EditGloveModePage(),
      ),
      GoRoute(
        path: kTutorialPage,
        builder: (BuildContext context, GoRouterState state) =>
            const TutorialPage(),
      ),
      GoRoute(
        path: kHelpCenterPage,
        builder: (BuildContext context, GoRouterState state) =>
            const HelpCenterPage(),
      ),GoRoute(
        path: kBugReportPage,
        builder: (BuildContext context, GoRouterState state) =>
            const BugReportPage(),
      ),
    ],
  );
}
