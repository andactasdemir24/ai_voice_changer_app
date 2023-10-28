import 'package:ai_voice_changer_app/app/data/service/voice_service.dart';
import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:ai_voice_changer_app/app/screens/home/view/generate_list.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../home/model/persons_model.dart';
import '../widgets/custom_playbutton.dart';
import '../widgets/custom_share_button.dart';

class LocalMediaPlayer extends StatefulWidget {
  const LocalMediaPlayer({super.key});

  @override
  State<LocalMediaPlayer> createState() => _LocalMediaPlayerState();
}

class _LocalMediaPlayerState extends State<LocalMediaPlayer> {
  List<PersonModel> persons = PersonModel.persons;
  VoiceService voiceUrl = VoiceService();
  bool isPlaying = false;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        position = Duration.zero; // Ses tamamlandığında slider'ı başa sıfırla
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });
  }

  void setAudio() {
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    audioPlayer.setSourceUrl(history.veri);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        text: MyConstants.mediaPlayerText,
        icon: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GenerateScreenList(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const AspectRatio(aspectRatio: 10 / 1), // Aspect ratio for spacing
            Container(
              height: height * 0.21,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyConstants.deepPurpleAccent,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 232, 118, 255),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(-3, 1),
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 65, 161, 240),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(1, -2),
                  ),
                ],
              ),
              child: Center(
                child: CircleAvatar(
                  radius: height * 0.1,
                  backgroundImage: AssetImage(history.image),
                  backgroundColor: const Color(0xffececec),
                ),
              ),
            ),
            const AspectRatio(aspectRatio: 10 / 1), // Aspect ratio for spacing
            const Text(
              MyConstants.mediaPlayerText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1C1C1E),
                fontSize: 17,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.41,
              ),
            ),
            const AspectRatio(aspectRatio: 1000 / 10), // Aspect ratio for spacing
            Text(
              history.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const AspectRatio(aspectRatio: 100 / 10), // Aspect ratio for spacing
            Slider(
              thumbColor: MyConstants.white,
              activeColor: MyConstants.deepPurpleAccent,
              inactiveColor: MyConstants.grey,
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.round());
                await audioPlayer.seek(position);
                await audioPlayer.resume();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: Text(formatTime(position), style: const TextStyle(fontSize: 15)),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width * 0.05),
                  child: Text(formatTime(duration - position), style: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            const AspectRatio(aspectRatio: 250 / 10), // Aspect ratio for spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    audioPlayer.seek(Duration(seconds: position.inSeconds - 1));
                  },
                  child: const Image(image: MyConstants.mediaMinus15),
                ),
                // GestureDetector(
                //   onTap: () async {
                //     if (isPlaying) {
                //       await audioPlayer.pause();
                //     } else {
                //       await audioPlayer.resume();
                //     }
                //   },
                //   child: PlayButton(
                //     width: width,
                //     height: height,
                //     icon: IconButton(
                //       onPressed: () async {
                //         if (isPlaying) {
                //           await audioPlayer.pause();
                //         } else {
                //           await audioPlayer.resume();
                //         }
                //       },
                //       icon:
                //           Icon(isPlaying ? Icons.pause : Icons.play_arrow, size: width * 0.1, color: MyConstants.white),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    audioPlayer.seek(Duration(seconds: position.inSeconds + 1));
                  },
                  child: const Image(image: MyConstants.mediaPlus15),
                ),
              ],
            ),
            const AspectRatio(aspectRatio: 60 / 10), // Aspect ratio for spacing
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomShareButton(width: width),
            )
          ],
        ),
      ),
    );
  }
}
