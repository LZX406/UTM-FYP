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
    apiKey: 'AIzaSyAw9AD9IYQMyOAbsF5BZc6j1rGxHfh-KSY',
    appId: '1:670368765893:web:606a4ac56f82c042edddac',
    messagingSenderId: '670368765893',
    projectId: 'task-management-43840',
    authDomain: 'task-management-43840.firebaseapp.com',
    storageBucket: 'task-management-43840.appspot.com',
    measurementId: 'G-ZQ94HH8ZSP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1MNeJ0UwqdwCMgQraWzG7vNqt_p8yL-A',
    appId: '1:670368765893:android:8db0600ff21c46c9edddac',
    messagingSenderId: '670368765893',
    projectId: 'task-management-43840',
    storageBucket: 'task-management-43840.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyButTUcwJIT_S7dj9_z4GGeuQvzTP5luQc',
    appId: '1:670368765893:ios:29c53b951d9c50acedddac',
    messagingSenderId: '670368765893',
    projectId: 'task-management-43840',
    storageBucket: 'task-management-43840.appspot.com',
    androidClientId: '670368765893-7e2chj2v9aill4k2suthd155u5gmji73.apps.googleusercontent.com',
    iosClientId: '670368765893-0tosppero6oa1sktu616fpaf2u70on2s.apps.googleusercontent.com',
    iosBundleId: 'com.example.test',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyButTUcwJIT_S7dj9_z4GGeuQvzTP5luQc',
    appId: '1:670368765893:ios:29c53b951d9c50acedddac',
    messagingSenderId: '670368765893',
    projectId: 'task-management-43840',
    storageBucket: 'task-management-43840.appspot.com',
    androidClientId: '670368765893-7e2chj2v9aill4k2suthd155u5gmji73.apps.googleusercontent.com',
    iosClientId: '670368765893-0tosppero6oa1sktu616fpaf2u70on2s.apps.googleusercontent.com',
    iosBundleId: 'com.example.test',
  );
}
