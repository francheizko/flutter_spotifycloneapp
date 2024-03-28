import "package:flutter/material.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/choose_artist.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/choose_podcast.dart";

import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/landing_screen.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_1.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_2.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_3.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_4.dart";
import "package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/signup_5.dart";

//provider
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/sign_up_data.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/sign_up_data_provider.dart';
import 'package:provider/provider.dart';

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

class SpotifyCloneApp extends StatelessWidget {
  const SpotifyCloneApp({Key? key}) : super(key: key);

  @override
 Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpData()),
      ],
      child: MaterialApp(
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
        },
      ),
    );
  }
}