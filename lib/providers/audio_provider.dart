import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioProvider = ChangeNotifierProvider((ref) => AudioNotifier());

class AudioNotifier extends ChangeNotifier {
  List<String> playlist = [
    'Musics/hev-abi-walang-alam.mp3',
    'Musics/oh-caraga-ayawnag-hilak.mp3'
  ];
  String audio = '';
  int _index = 0;
  //bool _isPlaying = false; // Define isPlaying property

  AudioNotifier() {
    audio = playlist[_index];
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
    playlist.add(song);
    notifyListeners();
  }

  void setSong(int index) {
    audio = playlist[index];
  }

  String getSong(int index) {
    audio = playlist[index];
    return audio;
  }

  List<String> getPlaylist() {
    return playlist;
  }

  int playlistLength() {
    return playlist.length;
  }

  void removeSong(int index) {
    playlist.removeAt(index);
    notifyListeners();
  }

  void removeAudio() {
    audio = '';
    notifyListeners();
  }

  // Getter and setter for isPlaying
  // bool get isPlaying => _isPlaying;

  //set isPlaying(bool value) {
  //  _isPlaying = value;
  //  notifyListeners();
  //}

  // Method to toggle isPlaying
  // void toggleIsPlaying() {
  //  _isPlaying = !_isPlaying;
  //  notifyListeners();
  // }
}
