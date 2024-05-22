import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotifycloneapp/models/music_model.dart';

final audioProvider = ChangeNotifierProvider((ref) => AudioNotifier());

class AudioNotifier extends ChangeNotifier {
  final List<String> audioFilePaths = [
    'Musics/hev-abi-walang-alam.mp3',
    'Musics/oh-caraga-ayawnag-hilak.mp3',
    'Musics/olivia-rodrigo-traitor.mp3'
  ];

  List<Music> musicList = [
    Music(
        title: 'Walang Alam',
        imagePath: 'assets/images/hev-abi.jpeg',
        artistName: 'Hev Abi'),
    Music(
        title: 'Ayaw Nag Hilak',
        imagePath: 'assets/images/oh-caraga.jpeg',
        artistName: 'Oh Caraga!'),
    Music(
        title: 'Traitor',
        imagePath: 'assets/images/olivia-rodrigo.jpeg',
        artistName: 'Olivia Rodrigo'),
  ];
  String audio = '';
  int _index = 0;

  AudioNotifier() {
    audio = audioFilePaths[_index];
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
}
