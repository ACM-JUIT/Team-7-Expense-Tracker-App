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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDjrMzHBF3ayQ9kyMEo_6d8sofYfTQYZyQ',
    appId: '1:629207988823:web:a1bb7b367615b43d1d8112',
    messagingSenderId: '629207988823',
    projectId: 'project-bb1c9',
    authDomain: 'project-bb1c9.firebaseapp.com',
    storageBucket: 'project-bb1c9.appspot.com',
    measurementId: 'G-NCGTV39C0S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADlwphuI0SV-YIWotO4xWGXzUix700xTo',
    appId: '1:629207988823:android:13ec217f068316ca1d8112',
    messagingSenderId: '629207988823',
    projectId: 'project-bb1c9',
    storageBucket: 'project-bb1c9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClD3MMDf7G7WzQKbkoN1I797xlAU8ZN8A',
    appId: '1:629207988823:ios:4c0053f1864296781d8112',
    messagingSenderId: '629207988823',
    projectId: 'project-bb1c9',
    storageBucket: 'project-bb1c9.appspot.com',
    iosBundleId: 'com.example.trial',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClD3MMDf7G7WzQKbkoN1I797xlAU8ZN8A',
    appId: '1:629207988823:ios:4c0053f1864296781d8112',
    messagingSenderId: '629207988823',
    projectId: 'project-bb1c9',
    storageBucket: 'project-bb1c9.appspot.com',
    iosBundleId: 'com.example.trial',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDjrMzHBF3ayQ9kyMEo_6d8sofYfTQYZyQ',
    appId: '1:629207988823:web:88a3fd1c47acb23b1d8112',
    messagingSenderId: '629207988823',
    projectId: 'project-bb1c9',
    authDomain: 'project-bb1c9.firebaseapp.com',
    storageBucket: 'project-bb1c9.appspot.com',
    measurementId: 'G-LEC0W4GNQK',
  );

}