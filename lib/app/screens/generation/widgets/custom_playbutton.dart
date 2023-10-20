import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
    required this.width,
    required this.height,
    required this.icon,
  }) : super(key: key);

  final double width;
  final double height;
  final IconButton icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.2,
      height: height * 0.1,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: width * 0.25,
              height: height * 0.12,
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.98, -0.18),
                  end: Alignment(0.98, 0.18),
                  colors: [Color(0xFF4E55FF), Color(0xFFB276FF)],
                ),
                shape: OvalBorder(),
                shadows: [
                  BoxShadow(
                    color: Color(0x726E56FF),
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: icon,
            ),
          ),
        ],
      ),
    );
  }
}
