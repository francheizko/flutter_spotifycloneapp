import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotifycloneapp/providers/firebase_storage_service.dart';
import 'package:flutter_spotifycloneapp/providers/authentication_service.dart';

// Define the Firebase Storage Service Provider
final firebaseStorageServiceProvider = Provider<FirebaseStorageService>((ref) {
 return FirebaseStorageService();
});

// Define the Authentication Service Provider
final authenticationServiceProvider = Provider<AuthenticationService>((ref) {
 return AuthenticationService();
});
