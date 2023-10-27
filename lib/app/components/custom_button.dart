// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.08,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.98, -0.18),
          end: Alignment(0.98, 0.18),
          colors: [Color(0xFF4E55FF), Color(0xFFB276FF)],
        ),
        borderRadius: BorderRadius.circular(150),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyConstants.transparent,
          shadowColor: MyConstants.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(150),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: MyConstants.white.withOpacity(0.5),
            fontSize: 17,
            fontWeight: FontWeight.w300,
            height: 0.08,
            letterSpacing: -0.41,
          ),
        ),
      ),
    );
  }
}
