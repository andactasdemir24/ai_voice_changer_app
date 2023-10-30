import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class CustomShareButton extends StatelessWidget {
  const CustomShareButton({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: width * 0.005, color: const Color(0xFF7764FF)),
          borderRadius: BorderRadius.circular(150),
        ),
      ),
      child: TextButton(
        onPressed: () async {
          await Share.share(voiceurl);
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        child: const Text(
          MyConstants.mediaPlayerShareText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF7764FF),
            fontSize: 17,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.41,
          ),
        ),
      ),
    );
  }
}
