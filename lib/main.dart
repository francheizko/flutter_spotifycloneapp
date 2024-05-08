import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/choose_artist.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/choose_podcast.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/landing_screen.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/login_screen.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_1.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_2.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_3.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_4.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_5.dart';
import 'package:flutter_spotifycloneapp/homescreen%20pages/album_view.dart';
import 'package:flutter_spotifycloneapp/homescreen%20pages/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//provider
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/sign_up_data.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/sign_up_data_provider.dart';
import 'package:provider/provider.dart' as provider;

void main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider(create: (_) => SignUpData()),
      ],
      child: const ProviderScope(child: SpotifyCloneApp()),
    ),
  );
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SignUp1(), 
        '/signup2': (context) => const SignUp2(),
        '/choose_artist': (context) => const ChooseArtistScreen(),
        '/choose_podcast': (context) => const ChoosePodcastScreen(),
        '/landing_screen': (context) => const LandingScreen(),
        '/signup3': (context) => const SignUp3(),
        '/signup4': (context) => const SignUp4(),
        '/signup5': (context) => const SignUp5(),
        '/login_screen': (context) => const LoginScreen(),
        '/home_screen': (context) => const HomeScreen(),
      },
    );
  }
}