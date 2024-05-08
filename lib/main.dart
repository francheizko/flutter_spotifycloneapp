import "dart:io";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_spotifycloneapp/homescreen%20pages/home_screen.dart";
import "package:flutter_spotifycloneapp/homescreen%20pages/track_view.dart";

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
        body: HomeScreen(),
      ),
    );
  }
}
