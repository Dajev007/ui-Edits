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
    apiKey: 'AIzaSyAV8H3EqYt3-MlXCc18VXoBtilGBEQc7B4',
    appId: '1:791283862952:web:7e69979048d94a93a5e19d',
    messagingSenderId: '791283862952',
    projectId: 'rvm123',
    authDomain: 'rvm123.firebaseapp.com',
    databaseURL: 'https://rvm123-default-rtdb.firebaseio.com',
    storageBucket: 'rvm123.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBml6FuMxSB0RVuDYyCaWAeuyA87nvZuyE',
    appId: '1:791283862952:android:767f67ff5113b5a1a5e19d',
    messagingSenderId: '791283862952',
    projectId: 'rvm123',
    databaseURL: 'https://rvm123-default-rtdb.firebaseio.com',
    storageBucket: 'rvm123.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9pRoPYQx_Jk0C1vs9Qr36ywjWEPPs-G4',
    appId: '1:791283862952:ios:a9348fac7e0b3449a5e19d',
    messagingSenderId: '791283862952',
    projectId: 'rvm123',
    databaseURL: 'https://rvm123-default-rtdb.firebaseio.com',
    storageBucket: 'rvm123.appspot.com',
    iosBundleId: 'com.example.reverseVendingMachine',
  );
}
