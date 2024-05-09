import 'package:flutter/material.dart';

// Step 1: Define a model class
class SignUpData extends ChangeNotifier {
  String email = '';
  String password = '';
  String gender = '';
  String dob = '';
  String name = '';
  bool agreeToTerms = false;
  bool receiveNewsAndOffers = false;
  bool shareRegistrationData = false;

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
    };
  }
}