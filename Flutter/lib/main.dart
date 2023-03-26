// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studygini/pages/loading.dart';
import 'package:studygini/pages/AuthService.dart';
import 'package:studygini/pages/Login.dart';
import 'package:studygini/pages/profile.dart';
import 'package:studygini/pages/notification.dart';
import 'package:studygini/pages/uploadpdf.dart';
import 'package:studygini/pages/askQuestion.dart';
import 'package:studygini/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    // giving default appearance till i implement the loading page

    initialRoute: '/home',
    routes: {
      '/loading': (context) => LoadingPage(),
      '/login': (context) => Login(),
      '/authGoogle': (context) => AuthService().handleAuthState(),
      '/profile': (context) => profile(),
      '/NotificationPage': (context) => NotificationPage(),
      '/UploadPDFPage': (context) => UploadPDFPage(),
      '/AskQuestionPage': (context) => AskQuestionPage(),
      '/home': (context) => HomePage(),
    },
  ));
}
