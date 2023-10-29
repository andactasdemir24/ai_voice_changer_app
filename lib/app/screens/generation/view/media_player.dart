// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:ai_voice_changer_app/app/data/service/voice_service.dart';
import 'package:ai_voice_changer_app/app/screens/home/view/generate_list.dart';
import 'package:rxdart/rxdart.dart';
import '../../home/model/persons_model.dart';
import '../model/position_model.dart';
import '../widgets/controls.dart';
import '../widgets/custom_share_button.dart';

class MediaPlayerScreen extends StatefulWidget {
  const MediaPlayerScreen({
    super.key,
  });

  @override
  State<MediaPlayerScreen> createState() => _MediaPlayerScreenState();
}

class _MediaPlayerScreenState extends State<MediaPlayerScreen> {
  List<PersonModel> persons = PersonModel.persons;
  VoiceService voiceUrl = VoiceService();
  late AudioPlayer _audioPlayer;

  Stream<PositionData> get _positionDataStream => Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _init();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _init() async {
    await _audioPlayer.setLoopMode(LoopMode.off);
    await _audioPlayer.setUrl(voiceurl);
  }

  void seekBackward() {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition - const Duration(seconds: 1);
    _audioPlayer.seek(newPosition);
  }

  void seekForward() {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition + const Duration(seconds: 1);
    _audioPlayer.seek(newPosition);
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const GenerateScreenList()));
              },
              icon: const Icon(Icons.arrow_back_ios_new))),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const AspectRatio(aspectRatio: 10 / 1),
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
                        offset: Offset(-3, 1)),
                    BoxShadow(
                        color: Color.fromARGB(255, 65, 161, 240),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(1, -2)),
                  ],
                ),
                child: Center(
                    child: CircleAvatar(
                        radius: height * 0.1,
                        backgroundImage: AssetImage(globalPerson.image),
                        backgroundColor: const Color(0xffececec)))),
            const AspectRatio(aspectRatio: 10 / 1),
            const Text(MyConstants.mediaPlayerText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF1C1C1E),
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.41)),
            const AspectRatio(aspectRatio: 1000 / 10),
            Text(globalPerson.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const AspectRatio(aspectRatio: 70 / 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
                  return ProgressBar(
                    barHeight: 6,
                    baseBarColor: MyConstants.grey,
                    progressBarColor: MyConstants.deepPurpleAccent,
                    thumbColor: const Color.fromARGB(255, 243, 242, 242),
                    timeLabelTextStyle: const TextStyle(
                      color: MyConstants.black,
                    ),
                    progress: positionData?.position ?? Duration.zero,
                    buffered: positionData?.bufferedPosition ?? Duration.zero,
                    total: positionData?.duration ?? Duration.zero,
                    onSeek: _audioPlayer.seek,
                  );
                },
              ),
            ),
            const AspectRatio(aspectRatio: 250 / 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(onTap: seekBackward, child: const Image(image: MyConstants.mediaMinus15)),
                Controls(audioPlayer: _audioPlayer),
                GestureDetector(onTap: seekForward, child: const Image(image: MyConstants.mediaPlus15)),
              ],
            ),
            const AspectRatio(aspectRatio: 60 / 10),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: CustomShareButton(width: width))
          ],
        ),
      ),
    );
  }
}
