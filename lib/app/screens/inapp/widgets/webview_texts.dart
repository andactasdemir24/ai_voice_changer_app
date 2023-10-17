// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ai_voice_changer_app/app/screens/inapp/view/webview.dart';

class UrlLauncherButton extends StatefulWidget {
  final String link;
  const UrlLauncherButton({
    Key? key,
    required this.link,
  }) : super(key: key);

  @override
  State<UrlLauncherButton> createState() => _UrlLauncherButtonState();
}

class _UrlLauncherButtonState extends State<UrlLauncherButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebView(
                  link: widget.link,
                ),
              ));
        },
        child: const Text(
          'Privacy Policy',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF2D2D2D),
            fontSize: 11,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            height: 0,
          ),
        ));
  }
}
