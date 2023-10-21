import 'package:hive/hive.dart';

part 'history.g.dart';

@HiveType(typeId: 1)
class History {
  @HiveField(0)
  String veri;

  @HiveField(1)
  String image;

  @HiveField(2)
  String name;

  @HiveField(3)
  String text;

  History({required this.veri, required this.image, required this.name, required this.text});
}
