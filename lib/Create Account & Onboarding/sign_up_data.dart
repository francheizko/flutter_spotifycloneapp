import 'package:flutter/material.dart';

class SignUpData extends ChangeNotifier {
  String email = '';
  String password = '';
  String gender = '';
  String dob = '';
  String name = '';
  bool agreeToTerms = false;
  bool receiveNewsAndOffers = false;
  bool shareRegistrationData = false;
  bool _isBelowThirteen = false; // Add this line

  bool get isBelowThirteen => _isBelowThirteen;
  set isBelowThirteen(bool value) {
    if (_isBelowThirteen != value) {
      _isBelowThirteen = value;
      notifyListeners();
    }
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void clearData() {
    email = '';
    password = '';
    gender = '';
    dob = '';
    name = '';
    agreeToTerms = false;
    receiveNewsAndOffers = false;
    shareRegistrationData = false;
    _isBelowThirteen = false; // Reset this as well
    notifyListeners();
  }

  // Convert SignUpData to JSON format
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'gender': gender,
      'dob': dob,
      'name': name,
      'agreeToTerms': agreeToTerms,
      'receiveNewsAndOffers': receiveNewsAndOffers,
      'shareRegistrationData': shareRegistrationData,
      'isBelowThirteen': _isBelowThirteen // Include this in your JSON if needed
    };
  }
}
