import 'package:flutter/material.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/sign_up_data.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/sign_up_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';

class SignUp1 extends StatelessWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignUpDataProvider( 
      signUpData: SignUpData(),
      child: Scaffold(
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
              const Text(
                'Create Account',
                style: TextStyle(
                  fontFamily: 'AvenirNext',
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: lwhite,
                ),
              ),
             SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                'What\'s your email?',
                style: TextStyle(
                  fontFamily: 'AvenirNext',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: lwhite,
                ),
              ),
                    
              Container(
                width: MediaQuery.of(context).size.width * 0.82,
                height: MediaQuery.of(context).size.height * 0.055,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: lgray,
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    
                    Provider.of<SignUpData>(context, listen: false).setEmail(value);
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.3),
                child: GestureDetector(
                  onTap: () {
                  
                    Navigator.pushNamed(context, '/signup2');
                  },
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
              ),
    
            ],
          ),
        ),
      ),
    );
  }
}
