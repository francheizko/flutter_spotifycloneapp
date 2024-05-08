import 'package:flutter/material.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

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
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                const Text(
                  'Log In',
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
              'Email or username',
              style: TextStyle(
                  fontFamily: 'AvenirNext',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: lwhite),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.82,
              height: MediaQuery.of(context).size.height * 0.055,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ldarkgray,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                    color: lwhite, fontFamily: 'AvenirNext', fontSize: 12),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              'Password',
              style: TextStyle(
                  fontFamily: 'AvenirNext',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: lwhite),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.82,
              height: MediaQuery.of(context).size.height * 0.055,
              child: Stack(
                children: [
                  TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ldarkgray,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(
                        color: lwhite, fontFamily: 'AvenirNext', fontSize: 12),
                  ),
                  Positioned(
                    right: 10,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: lwhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.3),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: lldarkergray,
                  ),
                  child: const Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
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
