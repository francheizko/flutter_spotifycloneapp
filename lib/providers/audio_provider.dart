import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotifycloneapp/models/music_model.dart';

final audioProvider = ChangeNotifierProvider((ref) => AudioNotifier());

class AudioNotifier extends ChangeNotifier {
  final List<String> audioFilePaths = [
    'Musics/hev-abi-walang-alam.mp3',
    'Musics/oh-caraga-ayawnag-hilak.mp3',
    'Musics/olivia-rodrigo-traitor.mp3',
    'Musics/jungkook-seven.mp3',
    'Musics/kendrick-lamar-love.mp3',
    'Musics/beyonce-donk.mp3',
    'Musics/bts-dynamite.mp3',
    'Musics/drake-gods-plan.mp3',
  ];

  List<Music> musicList = [
    Music(
      id: '1',
      title: 'Walang Alam',
      imagePath: 'assets/images/hev-abi.jpeg',
      artistName: 'Hev Abi',
      audioPath: 'Musics/hev-abi-walang-alam.mp3',
    ),
    Music(
      id: '2',
      title: 'Ayaw Nag Hilak',
      imagePath: 'assets/images/oh-caraga.jpeg',
      artistName: 'Oh Caraga!',
      audioPath: 'Musics/oh-caraga-ayawnag-hilak.mp3',
    ),
    Music(
      id: '3',
      title: 'Traitor',
      imagePath: 'assets/images/olivia-rodrigo.jpeg',
      artistName: 'Olivia Rodrigo',
      audioPath: 'Musics/olivia-rodrigo-traitor.mp3',
    ),
    Music(
      id: '4',
      title: 'Seven',
      imagePath: 'assets/images/jungkook.jpeg',
      artistName: 'Jungkook',
      audioPath: 'Musics/jungkook-seven.mp3',
    ),
    Music(
      id: '5',
      title: 'Love',
      imagePath: 'assets/images/kendrick-lamar.jpg',
      artistName: 'Kendrick Lamar',
      audioPath: 'Musics/kendrick-lamar-love.mp3',
    ),
    Music(
      id: '6',
      title: 'Donk',
      imagePath: 'assets/images/beyonce.jpg',
      artistName: 'Beyoncé',
      audioPath: 'Musics/beyonce-donk.mp3',
    ),
    Music(
      id: '7',
      title: 'Dynamite',
      imagePath: 'assets/images/bts.jpg',
      artistName: 'BTS',
      audioPath: 'Musics/bts-dynamite.mp3',
    ),
    Music(
      id: '8',
      title: 'God\'s Plan',
      imagePath: 'assets/images/drake.jpg',
      artistName: 'Drake',
      audioPath: 'Musics/drake-gods-plan.mp3',
    ),
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
