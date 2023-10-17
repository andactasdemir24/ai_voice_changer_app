import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:flutter/material.dart';

class GenerateScreen extends StatelessWidget {
  const GenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          text: MyConstants.appBarText,
          icon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ))),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                MyConstants.generateText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.41,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 5,
              maxLength: 250,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                hintText: MyConstants.generatehintText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
