import 'package:flutter/material.dart';

import '../model/persons_model.dart';

class CustomListContainer extends StatelessWidget {
  const CustomListContainer({
    super.key,
    required this.height,
    required this.width,
    required this.persons,
  });

  final double height;
  final double width;
  final List<PersonModel> persons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
              height: height * 0.15,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xffececec)),
              child: Row(
                children: [
                  Container(
                    height: height * 0.11,
                    width: width * 0.3,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurpleAccent, // Gri arka plan rengi
                    ),
                    child: Center(
                        child: CircleAvatar(
                      radius: 37,
                      backgroundImage: AssetImage(persons[index].image),
                      backgroundColor: const Color(0xffececec), // Varsa arka plan rengi
                      // Child boş olmalıdır
                      // fit: BoxFit.cover, // Resmi tam olarak doldurur
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("001 Generation",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                        Text(persons[index].name,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                          width: width * 0.5,
                          child: const Text(
                            "Lorem ipsum sit amet lorem ipsum s",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
