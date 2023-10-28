import 'package:flutter/material.dart';

import '../../../constants/const.dart';

class CheckBoxText extends StatelessWidget {
  final String text;
  const CheckBoxText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.shortestSide * 0.04;

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: MyConstants.black,
        fontSize: fontSize,
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w600,
        height: 0.08,
        letterSpacing: -0.41,
      ),
    );
  }
}
