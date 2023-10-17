// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final IconButton icon;
  const CustomAppBar({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          height: 0.06,
          letterSpacing: 0.35,
        ),
      ),
      leading: IconButton(
        icon: icon,
        onPressed: () {
          // Burada tıklanınca yapılacak işlemi belirleyebilirsiniz
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
