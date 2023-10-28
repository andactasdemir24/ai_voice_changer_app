import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double checkboxSize = width * 0.06;
    double borderWidth = width * 0.005;
    double iconSize = checkboxSize * 0.7;

    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: checkboxSize,
        height: checkboxSize * 1,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: borderWidth, color: const Color(0xFF4E55FF)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Center(
          child: value
              ? Icon(
                  Icons.circle,
                  size: iconSize,
                  color: const Color(0xFF4E55FF),
                )
              : Container(),
        ),
      ),
    );
  }
}
