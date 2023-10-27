// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../../constants/const.dart';
import '../../../theme/voice_icons_icons.dart';

class ClosedButton extends StatelessWidget {
  double? width;
  double? height;
  final Function() onPressed;
  ClosedButton({
    Key? key,
    this.width,
    this.height,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Yuvarlak şekil
          color: MyConstants.grey.withOpacity(0.6), // Dairesel arka plan rengi
        ),
        child: Center(
          child: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                VoiceIcons.btnClose,
                size: 30,
                color: MyConstants.white,
              )),
        ),
      ),
    );
  }
}
