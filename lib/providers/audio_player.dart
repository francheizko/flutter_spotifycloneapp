import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotifycloneapp/constants/constants.dart';
import 'package:flutter_spotifycloneapp/providers/audio_provider.dart';
import 'package:flutter_spotifycloneapp/providers/player_state_provider.dart';

class AudioPlayerUI extends ConsumerWidget {
  const AudioPlayerUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying =
        ref.watch(playerStateProvider.select((state) => state.isPlaying));
    final isMuted =
        ref.watch(playerStateProvider.select((state) => state.isMuted));
    final seekbarValue =
        ref.watch(playerStateProvider.select((state) => state.seekbarValue));
    final volumeValue =
        ref.watch(playerStateProvider.select((state) => state.volumeValue));

    return WillPopScope(
      onWillPop: () async => true,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Row(children: [
            IconButton(
              onPressed: () => ref.read(playerStateProvider.notifier).onPlay(),
              icon: Icon(
                color: lgreen,
                isPlaying ? Icons.pause : Icons.play_arrow_outlined,
                size: 50,
              ),
            ),
            IconButton(
              onPressed: () => ref.read(playerStateProvider.notifier).onStop(),
              icon: const Icon(
                Icons.stop,
                size: 50,
              ),
            ),
            Expanded(
              child: Slider(
                activeColor: lgreen,
                min: 0,
                max: 1,
                value: seekbarValue,
                onChanged: (newValue) => ref
                    .read(playerStateProvider.notifier)
                    .changeSeekbar(newValue),
              ),
            ),
            IconButton(
              onPressed: () => ref.read(playerStateProvider.notifier).onMute(),
              icon: Icon(
                isMuted ? Icons.volume_off : Icons.volume_up,
              ),
            ),
            SizedBox(
              width: 100,
              child: Slider(
                activeColor: lgreen,
                min: 0,
                max: 1,
                value: volumeValue,
                onChanged: (newValue) => ref
                    .read(playerStateProvider.notifier)
                    .onVolumeChange(newValue),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
