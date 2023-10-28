import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double textSize = width * 0.04;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: Row(
        children: [
          Image(image: MyConstants.inappIcons, width: width * 0.05),
          SizedBox(width: width * 0.02),
          Text(
            text,
            style: TextStyle(
              color: MyConstants.black,
              fontSize: textSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.41,
            ),
          ),
        ],
      ),
    );
  }
}
