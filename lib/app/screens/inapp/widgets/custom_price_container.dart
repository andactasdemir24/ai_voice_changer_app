import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/viewmodel/premium_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_checkbox.dart';
import 'custom_checkbox_text.dart';

class CustomPriceContainer extends StatefulWidget {
  const CustomPriceContainer({super.key});

  @override
  State<CustomPriceContainer> createState() => _CustomPriceContainerState();
}

class _CustomPriceContainerState extends State<CustomPriceContainer> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (context.read<PremiumViewModel>().getBoxClicked == false) {
            context.read<PremiumViewModel>().setBoxClicked(true);
          } else {
            context.read<PremiumViewModel>().setBoxClicked(false);
          }
          //print(widget.isPremium);
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
              value: context.watch<PremiumViewModel>().getBoxClicked,
              onChanged: (bool newValue) {
                context.read<PremiumViewModel>().setBoxClicked(newValue);
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
