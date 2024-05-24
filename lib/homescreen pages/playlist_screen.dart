import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_spotifycloneapp/models/music_model.dart';
import 'package:flutter_spotifycloneapp/providers/audio_player.dart';
import 'package:flutter_spotifycloneapp/providers/audio_provider.dart';
import 'package:flutter_spotifycloneapp/providers/player_state_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaylistScreen extends ConsumerStatefulWidget {
  final String playlistId;
  final String playlistName;
  final String imageUrl;

  const PlaylistScreen({
    super.key,
    required this.playlistId,
    required this.playlistName,
    required this.imageUrl,
  });

  @override
  ConsumerState<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends ConsumerState<PlaylistScreen> {
  late Future<List<Music>> _playlistMusic;
  late Future<String?> _userName;
  String? _selectedMusicId;
  @override
  void initState() {
    super.initState();

    _playlistMusic = _fetchPlaylistMusic();
    _userName = _fetchUserName();
  }

  Future<List<Music>> _fetchPlaylistMusic() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> musicIds = prefs.getStringList(widget.playlistId) ?? [];
    List<Music> musicList = [];
    for (String id in musicIds) {
      musicList.addAll(ref
          .read(audioProvider)
          .getMusicList()
          .where((music) => music.id == id));
    }
    return musicList;
  }

  Future<String?> _fetchUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return doc['name'];
    }
    return null;
  }

  void _showMoreOptions(BuildContext context, String musicId) {
    _selectedMusicId = musicId;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: backgroundc,
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.close, color: lwhite),
                title: const Text('Remove from playlist',
                    style: TextStyle(color: lwhite)),
                onTap: () {
                  _removeFromPlaylist(musicId);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: backgroundc,
                    content: Text(
                      'Music removed from playlist successfully!',
                    ),
                  ));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _removeFromPlaylist(String musicId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> musicIds = prefs.getStringList(widget.playlistId) ?? [];
    musicIds.remove(musicId);
    await prefs.setStringList(widget.playlistId, musicIds);

    setState(() {
      _playlistMusic = _fetchPlaylistMusic();
    });
  }

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(playerStateProvider);

    return Scaffold(
      backgroundColor: backgroundc,
      body: FutureBuilder<List<Music>>(
        future: _playlistMusic,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching playlist music'));
          } else {
            List<Music> playlistMusic = snapshot.data ?? [];
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    lgray,
                    Colors.black,
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'assets/images/Chevron left.svg',
                            width: MediaQuery.of(context).size.width * 0.025,
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: backgroundc,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              widget.imageUrl,
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.25,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.07,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.playlistName,
                              style: const TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                color: lwhite,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Created by',
                                  style: TextStyle(
                                    fontFamily: 'AvenirNext',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                // FutureBuilder to display username
                                FutureBuilder<String?>(
                                  future: _userName,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text(
                                        'Loading...',
                                        style: TextStyle(
                                          fontFamily: 'AvenirNext',
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return const Text(
                                        'Error',
                                        style: TextStyle(
                                          fontFamily: 'AvenirNext',
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      );
                                    } else {
                                      return Text(
                                        snapshot.data ?? 'User',
                                        style: const TextStyle(
                                          fontFamily: 'AvenirNext',
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/Heart.svg',
                                  width:
                                      MediaQuery.of(context).size.width * 0.025,
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                SvgPicture.asset(
                                  'assets/images/Download.svg',
                                  width:
                                      MediaQuery.of(context).size.width * 0.027,
                                  height: MediaQuery.of(context).size.height *
                                      0.027,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                SvgPicture.asset(
                                  'assets/images/More.svg',
                                  width:
                                      MediaQuery.of(context).size.width * 0.005,
                                  height: MediaQuery.of(context).size.height *
                                      0.005,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.001,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              playerState.onPlay();
                            },
                            child: Container(
                              child: playerState.isPlaying
                                  ? SvgPicture.asset(
                                      'assets/images/stop.svg',
                                      width: MediaQuery.of(context).size.width *
                                          0.065,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.065,
                                    )
                                  : SvgPicture.asset(
                                      'assets/images/Playbutton.svg',
                                      width: MediaQuery.of(context).size.width *
                                          0.065,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.065,
                                      fit: BoxFit.contain,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: playlistMusic.isEmpty
                          ? const Center(
                              child: Text(
                                'No songs',
                                style: TextStyle(fontSize: 18.0, color: lwhite),
                              ),
                            )
                          : ListView.builder(
                              itemCount: playlistMusic.length,
                              itemBuilder: (BuildContext context, int index) {
                                final music = playlistMusic[index];
                                final audio = music.audioPath;
                                final isSelected = (ref
                                            .read(playerStateProvider)
                                            .isPlaying ||
                                        ref
                                            .read(playerStateProvider)
                                            .isPaused) &&
                                    ref.read(audioProvider).getAudio() == audio;

                                return GestureDetector(
                                  onTap: () {
                                    final currentAudio =
                                        ref.read(audioProvider).getAudio();

                                    if (currentAudio == audio) {
                                      ref
                                          .read(playerStateProvider.notifier)
                                          .restartSong(audio);
                                    } else {
                                      ref
                                          .read(audioProvider.notifier)
                                          .setAudio(audio);
                                      ref
                                          .read(playerStateProvider.notifier)
                                          .onLoad(audio);
                                      ref
                                          .read(playerStateProvider.notifier)
                                          .onPlay();
                                    }
                                  },
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          music.imagePath,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.13,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.055,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  if (isSelected)
                                                    Image.asset(
                                                      'assets/images/audiowave-4.gif',
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.04,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.03,
                                                    ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.01,
                                                  ),
                                                  Text(
                                                    music.title,
                                                    style: TextStyle(
                                                      fontFamily: 'AvenirNext',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: isSelected
                                                          ? lgreen
                                                          : lwhite,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  const Spacer(),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _showMoreOptions(
                                                            context, music.id);
                                                      },
                                                      child: SvgPicture.asset(
                                                        'assets/images/More.svg',
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.005,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.005,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                music.artistName,
                                                style: const TextStyle(
                                                  fontFamily: 'AvenirNext',
                                                  fontSize: 14,
                                                  color: lwhite,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: const SizedBox(
        height: 100,
        child: AudioPlayerUI(),
      ),
    );
  }
}
