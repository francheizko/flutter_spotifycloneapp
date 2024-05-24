import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_spotifycloneapp/Create%20Account%20&%20Onboarding/sign_up_data.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_spotifycloneapp/Create Account & Onboarding/sign_up_data_provider.dart';
import 'package:provider/provider.dart';

class SignUp4 extends StatefulWidget {
  const SignUp4({Key? key}) : super(key: key);

  @override
  _SignUp4State createState() => _SignUp4State();
}

class _SignUp4State extends State<SignUp4> {
  @override
  Widget build(BuildContext context) {
    final signUpData = Provider.of<SignUpData>(context);

    return SignUpDataProvider(
      signUpData: signUpData,
      child: Scaffold(
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
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Text(
                'What\'s your date of birth?',
                style: TextStyle(
                  fontFamily: 'AvenirNext',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: lwhite,
                ),
              ),
              Consumer<SignUpData>(
                builder: (context, signUpData, _) {
                  TextEditingController _controller =
                      TextEditingController(text: signUpData.dob);
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.82,
                    height: MediaQuery.of(context).size.height * 0.055,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: lgray,
                    ),
                    child: TextFormField(
                      readOnly: true,
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          String formattedDate =
                              '${picked.year}-${picked.month}-${picked.day}';
                          signUpData.dob = formattedDate;
                          _controller.text = formattedDate;

                          DateTime today = DateTime.now();
                          int age = today.year - picked.year;
                          if (picked.month > today.month ||
                              (picked.month == today.month &&
                                  picked.day > today.day)) {
                            age--;
                          }

                          signUpData.isBelowThirteen = age < 13;
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Select your date of birth',
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      style: TextStyle(
                        color: signUpData.isBelowThirteen
                            ? Colors.red
                            : Colors.black,
                        fontSize: 14,
                      ),
                      controller: _controller,
                    ),
                  );
                },
              ),
              Consumer<SignUpData>(
                builder: (context, signUpData, _) {
                  return Visibility(
                    visible: signUpData.isBelowThirteen,
                    child: const Text(
                      "Sorry, you don't meet Spotify's age requirement",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.3,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: signUpData.isBelowThirteen
                        ? lldarkergray
                        : Colors.white,
                  ),
                  child: InkWell(
                    onTap: signUpData.isBelowThirteen
                        ? null
                        : () {
                            print('Stored date of birth: ${signUpData.dob}');
                            Navigator.pushReplacementNamed(context, '/signup3');
                          },
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: signUpData.isBelowThirteen
                              ? Colors.grey
                              : Colors.black,
                        ),
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
