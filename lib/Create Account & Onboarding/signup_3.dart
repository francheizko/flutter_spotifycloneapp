import 'package:flutter/material.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_svg/svg.dart';

class SignUp3 extends StatelessWidget {
  const SignUp3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundc,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/ChevronLeft.svg',
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                const Text(
                  'Create Account',
                  style: TextStyle(
                      fontFamily: 'AvenirNext',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: lwhite),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const Text(
              'What\'s your gender?',
              style: TextStyle(
                  fontFamily: 'AvenirNext',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: lwhite),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.82,
              height: MediaQuery.of(context).size.height * 0.055,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: lgray,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.3),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: lldarkergray,
                ),
                child: const Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                        fontFamily: 'AvenirNext',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
