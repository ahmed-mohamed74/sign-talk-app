import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_talk_app/view/screens/edit_glove_mode/edit_glove_mode.dart';
import 'package:sign_talk_app/view/screens/home_view.dart';
import 'package:sign_talk_app/view/screens/splash/splash-view.dart';
import 'package:sign_talk_app/view/screens/search_for_device/search_for_device.dart';

import '../../view/screens/login_register/sign_in.dart';
import '../../view/screens/login_register/sign_up.dart';
import '../../view/widgets/choose-language.dart';
import '../../view/widgets/select-profile.dart';

abstract class AppRouter {
  static const kSignUpPage = '/SignUpPage';
  static const kSignInPage = '/SignInPage';
  static const kHomeView = '/HomeView';
  static const kSelectProfile = '/SelectProfile';
  static const kSearchForDevice = '/SearchForDevice';
  static const kChooseLanguage = '/chooseLanguage';
  static const kEditWords = '/editWords';
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
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView(),
      ),
      GoRoute(
        path: kSelectProfile,
        builder: (BuildContext context, GoRouterState state) => const SelectProfile(),
      ),
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
    ],
  );
}
