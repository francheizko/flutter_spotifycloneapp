import "dart:io";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/choose_artist.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/choose_podcast.dart";

import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/landing_screen.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/login_screen.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_1.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_2.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_3.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_4.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_5.dart";
import "package:flutter_spotifycloneapp/homescreen%20pages/album_view.dart";
import "package:flutter_spotifycloneapp/homescreen%20pages/home_screen.dart";

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const ProviderScope(child: SpotifyCloneApp()));
}

class SpotifyCloneApp extends StatefulWidget {
  const SpotifyCloneApp({super.key});

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
        body: LoginScreen(),
      ),
    );
  }
}
