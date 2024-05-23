// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';


// class FirebaseStorageService {
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<String> getDownloadUrl(String filePath) async {
//     final ref = _storage.ref().child(filePath);
//     final downloadUrl = await ref.getDownloadURL();
//     return downloadUrl;
//   }
// }


// import 'package:firebase_storage/firebase_storage.dart';

// class FirebaseStorageService {
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<String> getDownloadUrl(String path) async {
//     try {
//       return await _storage.ref(path).getDownloadURL();
//     } catch (e) {
//       print('Error getting download URL: $e');
//       rethrow;
//     }
//   }
// }


// import 'package:firebase_storage/firebase_storage.dart';

// class FirebaseStorageService {
  // final FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<String> getDownloadUrl(String filePath) async {
//     try {
//       return await _storage.ref(filePath).getDownloadURL();
//     } catch (e) {
//       print('Error getting download URL: $e');
//       rethrow;
//     }
//   }
// }

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

Future<String> getDownloadUrl(String path) async {
    try {
      final ref = _storage.ref().child(path);
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error getting download URL: $e');
      rethrow;
    }
  }
}
