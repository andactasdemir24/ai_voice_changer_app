import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: width * 0.06,
        height: height * 0.03,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: width * 0.005, color: const Color(0xFF4E55FF)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Center(
          child: value
              ? const Icon(
                  Icons.circle,
                  size: 16.0,
                  color: Color(0xFF4E55FF),
                )
              : Container(), // İşaretli ise onay işareti, değilse boş container
        ),
      ),
    );
  }
}
