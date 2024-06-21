import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_talk_app/controllers/sensor_controller.dart';
import 'package:sign_talk_app/core/utils/constants.dart';
import 'package:sign_talk_app/core/utils/AppRouter.dart';

import 'controllers/data_controller.dart';
import 'firebase_options.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'controllers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    supportedLocales: ['en_US', 'ar'],
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: LocalizedApp(delegate, SignTalkApp()),
    ),
  );
}

class SignTalkApp extends StatelessWidget {
  SignTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SensorController(),
        ),
      ],
      child: Builder(builder: (context) {
        return Consumer<ThemeProvider>(
          builder:(context, themeProvider, child) => MaterialApp.router(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ar', ''),
            ],
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.themeMode,
          ),
        );
      }),
    );
  }
}
