import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:ai_voice_changer_app/app/screens/home/viewmodel/generate_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/const.dart';
import '../model/persons_model.dart';

class PersonsWidget extends StatelessWidget {
  const PersonsWidget({
    super.key,
    required this.persons,
  });

  final List<PersonModel> persons;

  @override
  Widget build(BuildContext context) {
    final generationViewModel = Provider.of<GenerateViewModel>(context);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    double cardWidth = width * 0.35;
    double cardHeight = height * 0.105;

    return Container(
      height: cardWidth * 2,
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: persons.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              generationViewModel.holdIndex(index);
            },
            child: Column(
              children: <Widget>[
                Container(
                  height: cardWidth * 0.6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        globalPerson == persons[index] ? MyConstants.purple : MyConstants.grey, // Gri arka plan rengi
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: cardWidth * 0.26,
                      backgroundImage: AssetImage(persons[index].image),
                      backgroundColor: const Color(0xffececec),
                    ),
                  ),
                ),
                SizedBox(height: cardHeight * 0.15), 
                Text(
                  persons[index].name,
                  style: TextStyle(
                    fontSize: width * 0.03, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: cardHeight, mainAxisSpacing: cardHeight * 0.1),
      ),
    );
  }
}
