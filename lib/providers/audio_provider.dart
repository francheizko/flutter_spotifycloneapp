import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotifycloneapp/models/music_model.dart';

final audioProvider = ChangeNotifierProvider((ref) => AudioNotifier());

class AudioNotifier extends ChangeNotifier {
  List<String> audioFilePaths = [];
  List<Music> musicList = [];
  String audio = '';
  int _index = 0;

  AudioNotifier() {
    fetchSongs();
  }

  int get index => _index;

  set index(int index) {
    _index = index;
    notifyListeners();
  }

  void setAudio(String audio) {
    this.audio = audio;
    notifyListeners();
  }

  String getAudio() {
    return audio;
  }

  void addSong(String song) {
    audioFilePaths.add(song);
    notifyListeners();
  }

  void setSong(int index) {
    audio = audioFilePaths[index];
  }

  String getSong(int index) {
    return audioFilePaths[index];
  }

  List<String> getAudioFilePaths() {
    return audioFilePaths;
  }

  List<Music> getMusicList() {
    return musicList;
  }

  int playlistLength() {
    return musicList.length;
  }

  void removeSong(int index) {
    musicList.removeAt(index);
    audioFilePaths.removeAt(index);
    notifyListeners();
  }

  void removeAudio() {
    audio = '';
    notifyListeners();
  }

 Future<void> fetchSongs() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('songs').get();
      print('Firestore snapshot obtained.');
      audioFilePaths = snapshot.docs
          .where((doc) => doc.data().containsKey('url'))
          .map((doc) => doc['url'] as String)
          .toList();
      print('Audio file paths fetched: $audioFilePaths');

      musicList = snapshot.docs
          .where((doc) =>
              doc.data().containsKey('title') &&
              doc.data().containsKey('imagePath') &&
              doc.data().containsKey('artist'))
          .map((doc) => Music(
                title: doc['title'] as String,
                imagePath: doc['imagePath'] as String,
                artistName: doc['artist'] as String,
              ))
          .toList();
      print('Music list fetched: ${musicList.length} items.');

      if (audioFilePaths.isNotEmpty) {
        audio = audioFilePaths[0];
      }
      notifyListeners();
    } catch (e) {
      print('Error fetching songs: $e');
    }
  }

}
