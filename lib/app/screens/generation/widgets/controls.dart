import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../constants/const.dart';
import 'custom_playbutton.dart';

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (!(playing ?? false)) {
          return PlayButton(
            onPressed: audioPlayer.play,
            icon: const Icon(
              Icons.play_arrow_rounded,
              color: MyConstants.white,
              size: 50,
            ),
          );
        } else if (processingState != ProcessingState.completed) {
          return PlayButton(
              onPressed: audioPlayer.pause,
              icon: const Icon(
                Icons.pause,
                color: MyConstants.white,
                size: 50,
              ));
        }
        return PlayButton(
          onPressed: audioPlayer.load,
          icon: const Icon(
            Icons.play_arrow_rounded,
            color: MyConstants.white,
            size: 50,
          ),
        );
      },
    );
  }
}
