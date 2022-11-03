import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // static const FirebaseOptions web = FirebaseOptions(
  //   apiKey: 'AIzaSyDmBjZYREBfP_QgkLGQJmCuWjBXCPHhLnk',
  //   appId: '1:1064550272009:web:fbf2db6ee03515b9867cd8',
  //   messagingSenderId: '1064550272009',
  //   projectId: 'myhabits2-flutter',
  //   authDomain: 'myhabits2-flutter.firebaseapp.com',
  //   storageBucket: 'myhabits2-flutter.appspot.com',
  //   measurementId: 'G-SCDW2MQ9WZ',
  // );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZza3jUkEVkGJZHOKYPPBRKZce1iEbVvo',
    appId: '1:1064550272009:android:ecea3032478574cb867cd8',
    messagingSenderId: '1091726103780',
    projectId: 'mini-project-catatan-keuangan',
    // storageBucket: 'myhabits2-flutter.appspot.com',
  );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: 'AIzaSyA0-0yvrg6OBcFHsk1dDhYHpetq5E_zN1E',
  //   appId: '1:1064550272009:ios:55bdb8ab1cbe1679867cd8',
  //   messagingSenderId: '1064550272009',
  //   projectId: 'myhabits2-flutter',
  //   storageBucket: 'myhabits2-flutter.appspot.com',
  //   iosClientId: '1064550272009-3p5o962ag73175o4r5dovie31rutjrl0.apps.googleusercontent.com',
  //   iosBundleId: 'com.example.myhabitsv2',
  // );

  // static const FirebaseOptions macos = FirebaseOptions(
  //   apiKey: 'AIzaSyA0-0yvrg6OBcFHsk1dDhYHpetq5E_zN1E',
  //   appId: '1:1064550272009:ios:55bdb8ab1cbe1679867cd8',
  //   messagingSenderId: '1064550272009',
  //   projectId: 'myhabits2-flutter',
  //   storageBucket: 'myhabits2-flutter.appspot.com',
  //   iosClientId: '1064550272009-3p5o962ag73175o4r5dovie31rutjrl0.apps.googleusercontent.com',
  //   iosBundleId: 'com.example.myhabitsv2',
  // );
}
