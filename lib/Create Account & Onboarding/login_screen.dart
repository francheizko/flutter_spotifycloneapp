import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isButtonEnabled = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkInputFields);
    _passwordController.addListener(_checkInputFields);
  }

  void _checkInputFields() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      if (!_isButtonEnabled) {
        setState(() {
          _isButtonEnabled = true;
        });
      }
    } else {
      if (_isButtonEnabled) {
        setState(() {
          _isButtonEnabled = false;
        });
      }
    }
  }

  Future<void> _login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, '/home_screen');
    } catch (e) {
      setState(() {
        _errorMessage = 'Incorrect email or password, please try again';
        _isButtonEnabled = false;
      });
      print('Login error: $e');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/images/ChevronLeft.svg',
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
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
                cursorColor: lgreen,
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ldarkgray,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                    color: lwhite, fontFamily: 'AvenirNext', fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
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
                    cursorColor: lgreen,
                    controller: _passwordController,
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
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'AvenirNext',
                    fontSize: 12,
                  ),
                ),
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.3),
              child: GestureDetector(
                onTap: _isButtonEnabled
                    ? () {
                        String email = _emailController.text;
                        String password = _passwordController.text.trim();
                        _login(email, password);
                      }
                    : null,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: _isButtonEnabled ? Colors.white : lldarkergray,
                  ),
                  child: Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: _isButtonEnabled ? Colors.black : Colors.grey),
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
