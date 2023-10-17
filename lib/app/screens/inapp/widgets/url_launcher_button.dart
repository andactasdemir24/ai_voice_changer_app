import 'package:ai_voice_changer_app/app/screens/inapp/view/webview.dart';
import 'package:flutter/material.dart';

class UrlLauncherButton extends StatefulWidget {
  const UrlLauncherButton({super.key});

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
                builder: (context) => const WebView(),
              ));
        },
        child: const Text('Privicy Policy'));
  }
}
