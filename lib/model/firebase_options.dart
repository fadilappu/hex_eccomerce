// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyCx0HSkeehGTHg2P27HSdbAzoXYRONb9o0',
    appId: '1:851113092741:web:e19b2490a682ce4a7d2bec',
    messagingSenderId: '851113092741',
    projectId: 'hex-ecommerce',
    authDomain: 'hex-ecommerce.firebaseapp.com',
    storageBucket: 'hex-ecommerce.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUk2RVUUGeimZ19edE6Yyp1g94dJ0AzXo',
    appId: '1:851113092741:android:777e0f1f058a7bc27d2bec',
    messagingSenderId: '851113092741',
    projectId: 'hex-ecommerce',
    storageBucket: 'hex-ecommerce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCg09-MR81XSh5zw8ts7wDRvoALVeN0Kfg',
    appId: '1:851113092741:ios:5e902469d502e0a27d2bec',
    messagingSenderId: '851113092741',
    projectId: 'hex-ecommerce',
    storageBucket: 'hex-ecommerce.appspot.com',
    iosBundleId: 'com.example.hexEcommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCg09-MR81XSh5zw8ts7wDRvoALVeN0Kfg',
    appId: '1:851113092741:ios:5fcaab33eae1db217d2bec',
    messagingSenderId: '851113092741',
    projectId: 'hex-ecommerce',
    storageBucket: 'hex-ecommerce.appspot.com',
    iosBundleId: 'com.example.hexEcommerce.RunnerTests',
  );
}
