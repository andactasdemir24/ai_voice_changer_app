class PersonModel {
  final String name;
  final String image;
  final bool isSelected = true;

  PersonModel({required this.name, required this.image});

  static List<PersonModel> persons = [
    PersonModel(name: 'Celebrity', image: 'assets/images/image1.png'),
    PersonModel(name: 'Omaba', image: 'assets/images/image2.png'),
    PersonModel(name: 'Elon', image: 'assets/images/image3.png'),
    PersonModel(name: 'Leo', image: 'assets/images/image4.png'),
    PersonModel(name: 'Celebrity', image: 'assets/images/image5.png'),
    PersonModel(name: 'Celebrity', image: 'assets/images/image6.png'),
    PersonModel(name: 'Celebrity', image: 'assets/images/image7.png'),
    PersonModel(name: 'Celebrity', image: 'assets/images/image8.png'),
    PersonModel(name: 'Celebrity', image: 'assets/images/image1.png'),
    PersonModel(name: 'Celebrity', image: 'assets/images/image1.png'),
  ];
}
