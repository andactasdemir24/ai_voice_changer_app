import 'package:flutter/material.dart';

import 'package:ai_voice_changer_app/app/screens/inapp/view/webview.dart';

class UrlLauncherButton extends StatefulWidget {
  final String link;
  final String text;
  const UrlLauncherButton({
    Key? key,
    required this.link,
    required this.text,
  }) : super(key: key);

  @override
  State<UrlLauncherButton> createState() => _UrlLauncherButtonState();
}

class _UrlLauncherButtonState extends State<UrlLauncherButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize = width * 0.025;

    return TextButton(
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              link: widget.link,
            ),
          ),
        );
      },
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFF2D2D2D),
          fontSize: fontSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
