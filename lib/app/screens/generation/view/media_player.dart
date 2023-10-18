import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:flutter/material.dart';

import '../../home/model/persons_model.dart';

class MediaPlayerScreen extends StatefulWidget {
  const MediaPlayerScreen({super.key});

  @override
  State<MediaPlayerScreen> createState() => _MediaPlayerScreenState();
}

class _MediaPlayerScreenState extends State<MediaPlayerScreen> {
  List<PersonModel> persons = PersonModel.persons;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(
          text: MyConstants.appBarText, icon: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new))),
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.1,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey, // Gri arka plan rengi
            ),
            child: Center(
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(globalPerson.image),
                backgroundColor: const Color(0xffececec),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            globalPerson.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
