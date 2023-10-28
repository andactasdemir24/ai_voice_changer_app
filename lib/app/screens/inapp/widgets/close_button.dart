import 'package:flutter/material.dart';
import '../../../constants/const.dart';
import '../../../theme/voice_icons_icons.dart';

class ClosedButton extends StatelessWidget {
  final Function() onPressed;

  const ClosedButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.shortestSide * 0.05;
    double containerSize = iconSize * 2.6;

    return Positioned(
      top: 50,
      right: 20,
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: MyConstants.grey.withOpacity(0.8),
        ),
        child: Center(
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              VoiceIcons.btnClose,
              size: iconSize * 1.7,
              color: MyConstants.white,
            ),
          ),
        ),
      ),
    );
  }
}
