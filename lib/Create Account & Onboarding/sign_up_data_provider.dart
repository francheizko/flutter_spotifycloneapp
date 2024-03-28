import 'package:flutter/material.dart';

import 'sign_up_data.dart';

class SignUpDataProvider extends InheritedWidget {
  final SignUpData signUpData;

  SignUpDataProvider({required this.signUpData, required Widget child}) : super(child: child);

  static SignUpDataProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SignUpDataProvider>();
  }

  @override
  bool updateShouldNotify(SignUpDataProvider oldWidget) {
    return signUpData != oldWidget.signUpData;
  }
}
