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
                              child: SvgPicture.asset(
                                'assets/images/More.svg',
                                width:
                                    MediaQuery.of(context).size.width * 0.005,
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
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
        // color: Theme.of(context).colorScheme.onPrimary,
        child: AudioPlayerUI(),
      ),
    );
  }
}
