import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_svg/svg.dart';

class SignUp5 extends StatefulWidget {
  const SignUp5({super.key});

  @override
  _SignUp5State createState() => _SignUp5State();
}

class _SignUp5State extends State<SignUp5> {
  bool spotifyTermsSelected = false;
  bool newsAndOffersSelected = false;
  bool registrationDataSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundc,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.08,
        ),
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
                    color: lwhite,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const Text(
              'What\'s your name?',
              style: TextStyle(
                fontFamily: 'AvenirNext',
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: lwhite,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.84,
              height: MediaQuery.of(context).size.height * 0.055,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: lgray,
              ),
            ),
            const Text(
              'This appears on your spotify profile',
              style: TextStyle(
                fontFamily: 'AvenirNext',
                fontSize: 8,
                fontWeight: FontWeight.w600,
                color: lwhite,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.001,
              ),
              child: Divider(
                height: MediaQuery.of(context).size.height * 0.001,
                color: lgray,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.19,
              height: MediaQuery.of(context).size.height * 0.025,
              decoration: const BoxDecoration(
                color: lgray,
              ),
              child: const Center(
                child: Text(
                  'REQUIRED',
                  style: TextStyle(
                    fontFamily: 'AvenirNext',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  'I agree to the Spotify Terms of Use and Privacy Policy.',
                  style: TextStyle(
                    fontFamily: 'AvenirNext',
                    fontSize: MediaQuery.of(context).size.width * 0.023,
                    fontWeight: FontWeight.w600,
                    color: lwhite,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      spotifyTermsSelected = !spotifyTermsSelected;
                    });
                  },
                  child: Container(
                    child: spotifyTermsSelected
                        ? Image.asset(
                            'assets/images/checked_icon.png',
                            width: MediaQuery.of(context).size.width * 0.07,
                            height: MediaQuery.of(context).size.width * 0.07,
                          )
                        : Image.asset(
                            'assets/images/circled-thin-24.png',
                            width: MediaQuery.of(context).size.width * 0.07,
                            height: MediaQuery.of(context).size.width * 0.07,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Terms of Use',
              style: TextStyle(
                fontFamily: 'AvenirNext',
                fontSize: MediaQuery.of(context).size.width * 0.030,
                fontWeight: FontWeight.w600,
                color: lgreen,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'To learn more about how Spotify collect, uses, shares and protects your personal data, Please see the Spotify Privacy Policy.',
              style: TextStyle(
                fontFamily: 'AvenirNext',
                fontSize: MediaQuery.of(context).size.width * 0.030,
                fontWeight: FontWeight.w600,
                color: lwhite,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontFamily: 'AvenirNext',
                fontSize: MediaQuery.of(context).size.width * 0.030,
                fontWeight: FontWeight.w600,
                color: lgreen,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Text(
                  'Please send me news and offers from Spotify.',
                  style: TextStyle(
                    fontFamily: 'AvenirNext',
                    fontSize: MediaQuery.of(context).size.width * 0.030,
                    fontWeight: FontWeight.w600,
                    color: lwhite,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      newsAndOffersSelected = !newsAndOffersSelected;
                    });
                  },
                  child: Container(
                    child: newsAndOffersSelected
                        ? Image.asset(
                            'assets/images/checked_icon.png',
                            width: MediaQuery.of(context).size.width * 0.07,
                            height: MediaQuery.of(context).size.width * 0.07,
                          )
                        : Image.asset(
                            'assets/images/circled-thin-24.png',
                            width: MediaQuery.of(context).size.width * 0.07,
                            height: MediaQuery.of(context).size.width * 0.07,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.75, // Adjust width as needed
                  child: Text(
                    'Share my registration data with Spotify\'s content providers for marketing purposes.',
                    style: TextStyle(
                      fontFamily: 'AvenirNext',
                      fontSize: MediaQuery.of(context).size.width * 0.030,
                      fontWeight: FontWeight.w600,
                      color: lwhite,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.001,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      registrationDataSelected = !registrationDataSelected;
                    });
                  },
                  child: Container(
                    child: registrationDataSelected
                        ? Image.asset(
                            'assets/images/checked_icon.png',
                            width: MediaQuery.of(context).size.width * 0.07,
                            height: MediaQuery.of(context).size.width * 0.07,
                          )
                        : Image.asset(
                            'assets/images/circled-thin-24.png',
                            width: MediaQuery.of(context).size.width * 0.07,
                            height: MediaQuery.of(context).size.width * 0.07,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: lwhite,
                ),
                child: const Center(
                  child: Text(
                    'Create an account',
                    style: TextStyle(
                      fontFamily: 'AvenirNext',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
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
