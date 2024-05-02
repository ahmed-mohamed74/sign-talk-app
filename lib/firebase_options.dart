// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB12gfL7i9pGuZisfxcBzoMZzJaevyyBfQ',
    appId: '1:579401546155:web:aa235600595f5a91973aee',
    messagingSenderId: '579401546155',
    projectId: 'sign-talk-f78c3',
    authDomain: 'sign-talk-f78c3.firebaseapp.com',
    storageBucket: 'sign-talk-f78c3.appspot.com',
    measurementId: 'G-6Z3DC5XWLM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA23716XBoZMPTYJBCd-HCl7lmB4r3YcU8',
    appId: '1:579401546155:android:14ffed7b127d7880973aee',
    messagingSenderId: '579401546155',
    projectId: 'sign-talk-f78c3',
    storageBucket: 'sign-talk-f78c3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqE4-Ts-1--tVCd5bPRfNig-96LMAFAKc',
    appId: '1:579401546155:ios:60dd8aec3d831bcb973aee',
    messagingSenderId: '579401546155',
    projectId: 'sign-talk-f78c3',
    storageBucket: 'sign-talk-f78c3.appspot.com',
    androidClientId: '579401546155-3ko6utf1ff58g6n08sdfrm21s4q36to3.apps.googleusercontent.com',
    iosClientId: '579401546155-29ma13rrlsaf4v2l8df09cq9jh27sunh.apps.googleusercontent.com',
    iosBundleId: 'com.example.signtalk',
  );

}