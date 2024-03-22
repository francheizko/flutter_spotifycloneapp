import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_svg/svg.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundc,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * -0.05,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Image.asset(
                'assets/images/landing_screen.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Millions of Songs.',
                    style: TextStyle(
                        fontFamily: 'AvenirNext',
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: lwhite),
                  ),
                  const Text(
                    'Free on Spotify.',
                    style: TextStyle(
                        fontFamily: 'AvenirNext',
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: lwhite),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: lgreen,
                    ),
                    child: const Center(
                      child: Text(
                        'Sign up free',
                        style: TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
                          width: 0.6,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/google_logo.svg',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 50),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
                          width: 0.6,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/facebook.svg',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 50),
                          const Text(
                            'Continue with Facebook',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
                          width: 0.6,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/apple_logo.svg',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 50),
                          const Text(
                            'Continue with Apple',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Log in',
                    style: TextStyle(
                        fontFamily: 'AvenirNext',
                        fontSize: 16,
                        color: lwhite,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
