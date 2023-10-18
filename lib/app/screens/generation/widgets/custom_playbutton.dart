import 'package:flutter/material.dart';

import '../../../theme/voice_icons_icons.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

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
                    blurRadius: 5.32,
                    offset: Offset(0, 2.66),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Icon(
                VoiceIcons.iconPremium,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
