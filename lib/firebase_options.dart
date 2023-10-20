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
    apiKey: 'AIzaSyAtCOx2FcyjxEG6sFGPKVY9QfAWfP-zfW4',
    appId: '1:626721926740:web:3a5ac1136d93fac89187c1',
    messagingSenderId: '626721926740',
    projectId: 'iamtif',
    authDomain: 'iamtif.firebaseapp.com',
    storageBucket: 'iamtif.appspot.com',
    measurementId: 'G-QBVYDTJ6TG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKx58mnL6AU768l2aZkM28dY7m1vFGMjY',
    appId: '1:626721926740:android:0593abcfd368ca689187c1',
    messagingSenderId: '626721926740',
    projectId: 'iamtif',
    storageBucket: 'iamtif.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaZ4Tc307L9EOb7TUsppg2K4FRFEyFPps',
    appId: '1:626721926740:ios:65a82914b9517f379187c1',
    messagingSenderId: '626721926740',
    projectId: 'iamtif',
    storageBucket: 'iamtif.appspot.com',
    iosBundleId: 'com.example.iamtif',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaZ4Tc307L9EOb7TUsppg2K4FRFEyFPps',
    appId: '1:626721926740:ios:df32f3429314e9ec9187c1',
    messagingSenderId: '626721926740',
    projectId: 'iamtif',
    storageBucket: 'iamtif.appspot.com',
    iosBundleId: 'com.example.iamtif.RunnerTests',
  );
}
