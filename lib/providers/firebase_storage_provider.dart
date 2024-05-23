  import 'package:flutter/material.dart';
  import 'package:firebase_storage/firebase_storage.dart';
  import 'package:just_audio/just_audio.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';

  final firebaseStorageProvider = ChangeNotifierProvider((ref) => FirebaseStorageNotifier());

  class FirebaseStorageNotifier extends ChangeNotifier {
    final AudioPlayer _audioPlayer = AudioPlayer();

    Future<void> streamAudioFromFirebase(String downloadUrl) async {
      try {
        final Reference ref = FirebaseStorage.instance.refFromURL(downloadUrl);
        final url = await ref.getDownloadURL();
        await _audioPlayer.setUrl(url);
        _audioPlayer.play();
      } catch (e) {
        print('Error streaming audio from Firebase: $e');
      }
    }


    @override
    void dispose() {
      _audioPlayer.dispose();
      super.dispose();
    }
  }