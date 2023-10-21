import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:flutter/material.dart';

import 'custom_checkbox.dart';
import 'custom_checkbox_text.dart';

class CustomPriceContainer extends StatefulWidget {
  const CustomPriceContainer({super.key});

  @override
  State<CustomPriceContainer> createState() => _CustomPriceContainerState();
}

class _CustomPriceContainerState extends State<CustomPriceContainer> {
  bool isPremium = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          isPremium = !isPremium;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: width * 0.005, color: const Color(0xFF4E55FF)),
            borderRadius: BorderRadius.circular(150),
          ),
        ),
        child: Row(
          children: <Widget>[
            CustomCheckbox(
              value: isPremium,
              onChanged: (bool newValue) {
                setState(() {
                  isPremium = newValue;
                });
              },
            ),
            SizedBox(width: width * 0.02),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckBoxText(text: MyConstants.checkBoxText1),
                  CheckBoxText(text: MyConstants.checkBoxText2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
