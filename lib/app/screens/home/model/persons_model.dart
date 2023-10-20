class PersonModel {
  final String token;
  final String name;
  final String image;

  PersonModel({required this.token, required this.name, required this.image});

  static List<PersonModel> persons = [
    PersonModel(name: 'Trump', image: 'assets/images/image1.png', token: 'TM:4v0ft4j72y2g'),
    PersonModel(name: 'Obama', image: 'assets/images/image2.png', token: 'TM:58vtv7x9f32c'),
    PersonModel(name: 'Taylor', image: 'assets/images/image3.png', token: 'TM:karas715w6en'),
    PersonModel(name: 'Elon', image: 'assets/images/image4.png', token: 'TM:0vckhrxztgcw'),
    PersonModel(name: 'Brady', image: 'assets/images/image5.png', token: 'TM:fnkmhbrznmeh'),
    PersonModel(name: 'Einstein', image: 'assets/images/image6.png', token: 'TM:knpfewyc2hts'),
    PersonModel(name: 'Britney', image: 'assets/images/image7.png', token: 'TM:jk8fegwaepfh'),
    PersonModel(name: 'Johnny', image: 'assets/images/image8.png', token: 'TM:1z2wh784gsb6'),
    PersonModel(name: 'Donkey', image: 'assets/images/image1.png', token: 'TM:9napv5ew50jv'),
    PersonModel(name: '2Pac', image: 'assets/images/image1.png', token: 'TM:jv2j06zg7vh0'),
  ];
}
