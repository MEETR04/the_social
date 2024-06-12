import 'package:flutter/material.dart';
import 'package:the_social/Pages/Homepage.dart';
import 'package:the_social/Pages/LandingPage.dart';
import 'package:the_social/Pages/LoginScreen.dart';
import 'package:the_social/Pages/SplashScreen.dart';
import 'package:the_social/Pages/StatusPage.dart';
import 'package:the_social/Pages/camera.dart';
import 'package:the_social/Widgets/CameraScreen.dart';
import 'package:camera/camera.dart';

import 'Pages/SelectContact.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage()
    );
  }
}
