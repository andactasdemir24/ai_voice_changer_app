/* import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../../constants/global_veriables.dart';

class AudioViewModel with ChangeNotifier {
  bool isPlaying = false;
  final audioPlayer = AudioPlayer();

  Duration duraiton = Duration.zero;
  Duration position = Duration.zero;

  void changed() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying = state == PlayerState.playing;
      notifyListeners();
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      duraiton = newDuration;
      notifyListeners();
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      position = newPosition;
      notifyListeners();
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.setSourceUrl(voiceurl);
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duraiton.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
 */