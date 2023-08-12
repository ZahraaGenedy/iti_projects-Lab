import 'package:hive/hive.dart';

part 'book_model.g.dart';
@HiveType(typeId: 0)
class BookModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String testType;
  @HiveField(2)
  String time;
  @HiveField(3)
  String date;
  @HiveField(4)
  String gender;


  BookModel({
    required this.name,
    required this.testType,
    required this.time,
    required this.date,
    required this.gender,
  });
}
