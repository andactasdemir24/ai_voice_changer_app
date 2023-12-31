// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:flutter/material.dart';

import 'package:ai_voice_changer_app/app/screens/inapp/view/webview.dart';

class SettingsWebview extends StatefulWidget {
  final String link;
  final String text;
  const SettingsWebview({
    Key? key,
    required this.link,
    required this.text,
  }) : super(key: key);

  @override
  State<SettingsWebview> createState() => _SettingsWebviewState();
}

class _SettingsWebviewState extends State<SettingsWebview> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.015),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: width * 0.06, // Adjust the multiplier as needed
              color: MyConstants.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
