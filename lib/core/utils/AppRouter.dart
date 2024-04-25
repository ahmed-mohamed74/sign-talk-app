import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_talk_app/Features/sign/views/home_view.dart';
import 'package:sign_talk_app/Features/splash/presentation/views/splash-view.dart';
import 'package:sign_talk_app/Features/widgets/choose-language.dart';
import 'package:sign_talk_app/Features/widgets/my-profile.dart';
import 'package:sign_talk_app/Features/widgets/search_for_device.dart';
import 'package:sign_talk_app/Features/widgets/select-profile.dart';

import '../../Features/sign/views/sign_in.dart';
import '../../Features/sign/views/sign_up.dart';

abstract class AppRouter
{
  static const kSignUpPage = '/SignUpPage';
  static const kSignInPage = '/SignInPage';
  static const kHomeView = '/HomeView';
  static const kMyProfile = '/MyProfile';
  static const kSelectProfile = '/SelectProfile';
  static const kSearchForDevice = '/SearchForDevice';
 static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kSignInPage,
        builder: (BuildContext context, GoRouterState state) =>  SignInPage(),

      ),
      GoRoute(
         path: kSignUpPage,
          builder: (BuildContext context, GoRouterState state)=>  SignUpPage(),
      ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state)=> const SplashView(),
      ),

      GoRoute(
        path: '/HomeView',
        builder: (BuildContext context, GoRouterState state)=> const HomeView(),
      ),
      GoRoute(
        path: kSelectProfile,
        builder: (BuildContext context, GoRouterState state)=> const SelectProfile(),
      ),
      GoRoute(
        path: kSearchForDevice,
        builder: (BuildContext context, GoRouterState state)=> const SearchForDevice(),
      ),
      GoRoute(
        path: kMyProfile,
        builder: (BuildContext context, GoRouterState state)=> const MyProfile(),
      ),
    ],
  );
}


