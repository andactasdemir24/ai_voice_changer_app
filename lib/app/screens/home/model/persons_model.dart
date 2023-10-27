class PersonModel {
  final String token;
  final String name;
  final String image;

  PersonModel({required this.token, required this.name, required this.image});

  static List<PersonModel> persons = [
    PersonModel(name: 'Trump', image: 'assets/images/image1.png', token: 'TM:4v0ft4j72y2g'),
    PersonModel(name: 'Obama', image: 'assets/images/image2.png', token: 'TM:58vtv7x9f32c'),
    PersonModel(name: 'Morgan', image: 'assets/images/image3.png', token: 'TM:xcx5ytjsv8b3'),
    PersonModel(name: 'John', image: 'assets/images/image4.png', token: 'TM:fyqkwgdd09ey'),
    PersonModel(name: 'Brady', image: 'assets/images/image5.png', token: 'TM:fnkmhbrznmeh'),
    PersonModel(name: 'A.Tate', image: 'assets/images/image6.png', token: 'TM:43c7p13p3z5c'),
    PersonModel(name: 'Zendaya', image: 'assets/images/image7.png', token: 'TM:f5hcw922p29b'),
    PersonModel(name: 'Eminem', image: 'assets/images/image8.png', token: 'TM:pdf9c1anbdjq'),
    PersonModel(name: 'Barbie', image: 'assets/images/image1.png', token: 'TM:1zj2er3hdwhb'),
    PersonModel(name: '2Pac', image: 'assets/images/image1.png', token: 'TM:jv2j06zg7vh0'),
  ];
}
