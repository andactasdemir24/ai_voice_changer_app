// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../constants/const.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  const CustomListTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: MyConstants.black),
      ),
    );
  }
}
