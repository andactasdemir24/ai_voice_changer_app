import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:ai_voice_changer_app/app/theme/voice_icons_icons.dart';
import 'package:flutter/material.dart';
import '../../home/model/persons_model.dart';
import '../widgets/custom_playbutton.dart';

class MediaPlayerScreen extends StatefulWidget {
  const MediaPlayerScreen({super.key});

  @override
  State<MediaPlayerScreen> createState() => _MediaPlayerScreenState();
}

class _MediaPlayerScreenState extends State<MediaPlayerScreen> {
  List<PersonModel> persons = PersonModel.persons;
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(
          text: MyConstants.appBarText, icon: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new))),
      body: Column(
        children: <Widget>[
          const AspectRatio(aspectRatio: 100 / 10),
          Container(
            height: height * 0.2,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurpleAccent, // Gri arka plan rengi
            ),
            child: Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(globalPerson.image),
                backgroundColor: const Color(0xffececec),
              ),
            ),
          ),
          const AspectRatio(aspectRatio: 100 / 10),
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
          const AspectRatio(aspectRatio: 1000 / 10),
          Text(
            globalPerson.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const AspectRatio(aspectRatio: 100 / 10),
          Slider(
            thumbColor: Colors.white,
            activeColor: Colors.deepPurpleAccent,
            inactiveColor: Colors.grey,
            min: 0,
            max: 100,
            value: sliderValue,
            onChanged: (double value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  sliderValue.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  sliderValue.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          const AspectRatio(aspectRatio: 150 / 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(onTap: () {}, child: const Image(image: MyConstants.mediaMinus15)),
              PlayButton(width: width, height: height),
              GestureDetector(onTap: () {}, child: const Image(image: MyConstants.mediaPlus15)),
            ],
          ),
        ],
      ),
    );
  }
}
