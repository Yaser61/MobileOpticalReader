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
    apiKey: 'AIzaSyCZq5rmT-m1eNwHl-kbOq8dwZj0NXQA1y4',
    appId: '1:1059830261802:web:9724950c712d64fff3bb53',
    messagingSenderId: '1059830261802',
    projectId: 'bitirme-projesi-e8bbc',
    authDomain: 'bitirme-projesi-e8bbc.firebaseapp.com',
    storageBucket: 'bitirme-projesi-e8bbc.appspot.com',
    measurementId: 'G-WH42GT1P4D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhCMmx29NXJb0ebVkuHCF22d_VLFgMWQA',
    appId: '1:1059830261802:android:c76e17d11fd7a61cf3bb53',
    messagingSenderId: '1059830261802',
    projectId: 'bitirme-projesi-e8bbc',
    storageBucket: 'bitirme-projesi-e8bbc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgG5HMetfBsQx1bKexS4lLXUx9O616ytI',
    appId: '1:1059830261802:ios:3a129d3d4ed41c54f3bb53',
    messagingSenderId: '1059830261802',
    projectId: 'bitirme-projesi-e8bbc',
    storageBucket: 'bitirme-projesi-e8bbc.appspot.com',
    iosBundleId: 'com.example.mobileOpticalReader',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgG5HMetfBsQx1bKexS4lLXUx9O616ytI',
    appId: '1:1059830261802:ios:3a129d3d4ed41c54f3bb53',
    messagingSenderId: '1059830261802',
    projectId: 'bitirme-projesi-e8bbc',
    storageBucket: 'bitirme-projesi-e8bbc.appspot.com',
    iosBundleId: 'com.example.mobileOpticalReader',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCZq5rmT-m1eNwHl-kbOq8dwZj0NXQA1y4',
    appId: '1:1059830261802:web:a92ce479e7ff941ff3bb53',
    messagingSenderId: '1059830261802',
    projectId: 'bitirme-projesi-e8bbc',
    authDomain: 'bitirme-projesi-e8bbc.firebaseapp.com',
    storageBucket: 'bitirme-projesi-e8bbc.appspot.com',
    measurementId: 'G-1VZ6T07NBT',
  );
}
