import "package:flutter/material.dart";

import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/landing_screen.dart";

void main() {
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
        body: LandingScreen(),
      ),
    );
  }
}
