import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:ai_voice_changer_app/app/screens/home/viewmodel/generate_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    var height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height * 0.35,
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: globalPerson == persons[index] ? Colors.purple : Colors.grey, // Gri arka plan rengi
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(persons[index].image),
                      backgroundColor: const Color(0xffececec),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  persons[index].name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 75, mainAxisSpacing: 10),
      ),
    );
  }
}
