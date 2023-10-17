import 'package:flutter/material.dart';

class CheckBoxText extends StatelessWidget {
  final String text;
  const CheckBoxText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w600,
        height: 0.08,
        letterSpacing: -0.41,
      ),
    );
  }
}
