import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_spotifycloneapp/models/music_model.dart';
import 'package:flutter_spotifycloneapp/providers/audio_player.dart';
import 'package:flutter_spotifycloneapp/providers/audio_provider.dart';
import 'package:flutter_spotifycloneapp/providers/player_state_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AlbumView extends ConsumerWidget {
  const AlbumView({super.key});

  Future<List<Map<String, dynamic>>> _getPlaylistsFromFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return [];
      }

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('playlists')
              .where('user_id', isEqualTo: user.uid)
              .get();

      return querySnapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data()})
          .toList();
    } catch (e) {
      print('Error fetching playlists: $e');
      return [];
    }
  }

  Future<void> _addMusicToPlaylists(
      Music music, List<String> selectedPlaylists) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      for (String playlistId in selectedPlaylists) {
        List<String> playlist = prefs.getStringList(playlistId) ?? [];
        playlist.add(music.id);
        await prefs.setStringList(playlistId, playlist);
      }
    } catch (e) {
      print('Error adding music to playlists: $e');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerStateProvider);

    void _showMoreOptions(BuildContext context, Music music) async {
      final playlists = await _getPlaylistsFromFirestore();

      void _showPlaylistsModal(
          BuildContext context, List<Map<String, dynamic>> playlists) {
        List<String> selectedPlaylists = [];

        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return Container(
              color: backgroundc,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: playlists.map((playlist) {
                        bool isSelected = false;

                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.008,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      leading: Image.asset(
                                        playlist['image'],
                                        fit: BoxFit.cover,
                                        width: 67,
                                        height: 67,
                                      ),
                                      title: Text(playlist['name'],
                                          style:
                                              const TextStyle(color: lwhite)),
                                      onTap: () {
                                        setState(() {
                                          isSelected = !isSelected;
                                          if (isSelected) {
                                            selectedPlaylists
                                                .add(playlist['id']);
                                          } else {
                                            selectedPlaylists
                                                .remove(playlist['id']);
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelected = !isSelected;
                                        if (isSelected) {
                                          selectedPlaylists.add(playlist['id']);
                                        } else {
                                          selectedPlaylists
                                              .remove(playlist['id']);
                                        }
                                      });
                                    },
                                    child: Container(
                                      child: isSelected
                                          ? Image.asset(
                                              'assets/images/checked_icon.png',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07,
                                            )
                                          : Image.asset(
                                              'assets/images/circled-thin-24.png',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07,
                                              fit: BoxFit.contain,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () async {
                        await _addMusicToPlaylists(music, selectedPlaylists);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: backgroundc,
                          content: Text(
                            'Music added from playlist successfully!',
                          ),
                        ));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: lgreen,
                        ),
                        child: const Center(
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  )
                ],
              ),
            );
          },
        );
      }

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: backgroundc,
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.playlist_add, color: lwhite),
                  title: const Text('Add to Playlist',
                      style: TextStyle(color: lwhite)),
                  onTap: () {
                    Navigator.pop(context);
                    _showPlaylistsModal(context, playlists);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: backgroundc,
                      content: Text(
                        'Music added to playlist successfully!',
                      ),
                    ));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite, color: lwhite),
                  title: const Text('Like', style: TextStyle(color: lwhite)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.queue, color: lwhite),
                  title: const Text('Add to Queue',
                      style: TextStyle(color: lwhite)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share, color: lwhite),
                  title: const Text('Share', style: TextStyle(color: lwhite)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundc,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red,
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
                        'assets/images/tth.jpeg',
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
                      const Text(
                        'Today\'s Top Hits',
                        style: TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: lwhite,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Text(
                        '34,495,266 saves ∙ 2h 36m',
                        style: TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/Heart.svg',
                            width: MediaQuery.of(context).size.width * 0.025,
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.07,
                          ),
                          SvgPicture.asset(
                            'assets/images/Download.svg',
                            width: MediaQuery.of(context).size.width * 0.027,
                            height: MediaQuery.of(context).size.height * 0.027,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.07,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/images/More.svg',
                              width: MediaQuery.of(context).size.width * 0.005,
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
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
                                width:
                                    MediaQuery.of(context).size.width * 0.065,
                                height:
                                    MediaQuery.of(context).size.height * 0.065,
                              )
                            : SvgPicture.asset(
                                'assets/images/Playbutton.svg',
                                width:
                                    MediaQuery.of(context).size.width * 0.065,
                                height:
                                    MediaQuery.of(context).size.height * 0.065,
                                fit: BoxFit.contain,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: ref.read(audioProvider).playlistLength(),
                  itemBuilder: (BuildContext context, int index) {
                    final music = ref.read(audioProvider).getMusicList()[index];
                    final audio =
                        ref.read(audioProvider).getAudioFilePaths()[index];
                    final isSelected =
                        (ref.read(playerStateProvider).isPlaying ||
                                ref.read(playerStateProvider).isPaused) &&
                            ref.read(audioProvider).getAudio() == audio;

                    return GestureDetector(
                      onTap: () {
                        final audio =
                            ref.read(audioProvider).getAudioFilePaths()[index];
                        final currentAudio = ref.read(audioProvider).getAudio();

                        if (currentAudio == audio) {
                          ref
                              .read(playerStateProvider.notifier)
                              .restartSong(audio);
                        } else {
                          ref.read(audioProvider.notifier).setAudio(audio);
                          ref.read(playerStateProvider.notifier).onLoad(audio);
                          ref.read(playerStateProvider.notifier).onPlay();
                        }
                      },
                      child: SizedBox(
                        child: Row(
                          children: [
                            Image.asset(
                              music.imagePath,
                              width: MediaQuery.of(context).size.width * 0.13,
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      if (isSelected)
                                        Image.asset(
                                          'assets/images/audiowave-4.gif',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                        ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.005,
                                      ),
                                      Text(
                                        music.title,
                                        style: TextStyle(
                                          fontFamily: 'AvenirNext',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: isSelected ? lgreen : lwhite,
                                        ),
                                        textAlign: TextAlign.left,
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
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  _showMoreOptions(context, music);
                                },
                                child: SvgPicture.asset(
                                  'assets/images/More.svg',
                                  width:
                                      MediaQuery.of(context).size.width * 0.005,
                                  height: MediaQuery.of(context).size.height *
                                      0.005,
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
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
      ),
      bottomNavigationBar: const SizedBox(
        height: 100,
        child: AudioPlayerUI(),
      ),
    );
  }
}
