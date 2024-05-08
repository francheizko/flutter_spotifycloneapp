import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_spotifycloneapp/providers/audio_player.dart';
import 'package:flutter_spotifycloneapp/providers/audio_provider.dart';
import 'package:flutter_spotifycloneapp/providers/player_state_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumView extends ConsumerWidget {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerStateProvider);

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
                height: MediaQuery.of(context).size.width * 0.05,
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
                          SvgPicture.asset(
                            'assets/images/More.svg',
                            width: MediaQuery.of(context).size.width * 0.005,
                            height: MediaQuery.of(context).size.height * 0.005,
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
                      top: MediaQuery.of(context).size.height * 0.04,
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
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        String currentSong = 'Musics/hev-abi-walang-alam.mp3';
                        if (ref.read(audioProvider).getAudio() == currentSong) {
                          ref
                              .read(playerStateProvider.notifier)
                              .restartSong(currentSong);
                        } else {
                          ref
                              .read(audioProvider.notifier)
                              .setAudio(currentSong);
                          ref
                              .read(playerStateProvider.notifier)
                              .onLoad(currentSong);
                          ref
                              .read(playerStateProvider.notifier)
                              .onPlay(); // This line will now be responsible for starting the song
                        }
                      },
                      child: SizedBox(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/hev-abi.jpeg',
                              width: MediaQuery.of(context).size.width * 0.13,
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Walang Alam',
                                    style: TextStyle(
                                      fontFamily: 'AvenirNext',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: lwhite,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'Hev Abi',
                                    style: TextStyle(
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
                              child: SvgPicture.asset(
                                'assets/images/More.svg',
                                width:
                                    MediaQuery.of(context).size.width * 0.005,
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.015,
                    ),
                    GestureDetector(
                      onTap: () {
                        String currentSong =
                            'Musics/oh-caraga-ayawnag-hilak.mp3';
                        if (ref.read(audioProvider).getAudio() == currentSong) {
                          ref
                              .read(playerStateProvider.notifier)
                              .restartSong(currentSong);
                        } else {
                          ref
                              .read(audioProvider.notifier)
                              .setAudio(currentSong);
                          ref
                              .read(playerStateProvider.notifier)
                              .onLoad(currentSong);
                          ref
                              .read(playerStateProvider.notifier)
                              .onPlay(); // This line will now be responsible for starting the song
                        }
                      },
                      child: SizedBox(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/oh-caraga.jpeg',
                              width: MediaQuery.of(context).size.width * 0.13,
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ayaw Nag Hilak',
                                    style: TextStyle(
                                      fontFamily: 'AvenirNext',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: lwhite,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'Hev Abi',
                                    style: TextStyle(
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
                              child: SvgPicture.asset(
                                'assets/images/More.svg',
                                width:
                                    MediaQuery.of(context).size.width * 0.005,
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.015,
                    ),
                    // Add more GestureDetector widgets here for additional music items
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 100,
        // color: Theme.of(context).colorScheme.onPrimary,
        child: AudioPlayerUI(),
      ),
    );
  }
}
