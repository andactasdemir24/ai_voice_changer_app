import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final Function() onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.2,
      height: height * 0.1,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.98, -0.18),
          end: Alignment(0.98, 0.18),
          colors: [Color(0xFF4E55FF), Color(0xFFB276FF)],
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0x726E56FF),
            blurRadius: width * 0.01,
            offset: Offset(0, width * 0.005),
          ),
        ],
      ),
      child: Center(child: IconButton(onPressed: onPressed, icon: icon)),
    );
  }
}
