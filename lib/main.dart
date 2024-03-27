import "package:flutter/material.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/choose_artist.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/choose_podcast.dart";

import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/landing_screen.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_1.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_2.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_3.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_4.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_5.dart";

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
     
  runApp(
    const SpotifyCloneApp(),
  );
}

class SpotifyCloneApp extends StatefulWidget {
  const SpotifyCloneApp({Key? key}) : super(key: key);

  @override
  State<SpotifyCloneApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SpotifyCloneApp> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFCFCFC),
        body: SignUp5(),
      ),
    );
  }
}
