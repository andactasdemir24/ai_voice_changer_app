class PersonModel {
  final String token;
  final String name;
  final String image;
  final bool isSelected = true;

  PersonModel({required this.token, required this.name, required this.image});

  static List<PersonModel> persons = [
    PersonModel(name: 'Trump A', image: 'assets/images/image1.png', token: 'TM:jv2j06zg7vh0'),
    PersonModel(name: 'Obama', image: 'assets/images/image2.png', token: 'TM:jv2j06zg7vh0'),
    PersonModel(name: 'Elon', image: 'assets/images/image3.png', token: 'TM:jv2j06zg7vh0'),
    PersonModel(name: 'Elon', image: 'assets/images/image4.png', token: 'TM:jv2j06zg7vh0'),
    PersonModel(name: '2Pac', image: 'assets/images/image5.png', token: 'TM:jv2j06zg7vh0'),
    PersonModel(name: 'Einstein', image: 'assets/images/image6.png', token: 'TM:jv2j06zg7vh0'),
    PersonModel(name: 'Celebrity', image: 'assets/images/image7.png', token: 'TM:jv2j06zg7vh0'),
    PersonModel(name: 'Celebrity', image: 'assets/images/image8.png', token: 'TM:jv2j06zg7vh0'),
    PersonModel(name: 'Celebrity', image: 'assets/images/image1.png', token: 'TM:jv2j06zg7vh0'),
    PersonModel(name: 'Celebrity', image: 'assets/images/image1.png', token: 'TM:jv2j06zg7vh0'),
  ];
}
