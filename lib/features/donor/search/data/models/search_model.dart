import 'package:hive/hive.dart';

part 'search_model.g.dart';

@HiveType(typeId: 2)
class SearchModel extends HiveObject {
  SearchModel({
    required this.Governorate,
    required this.City,
    required this.Condition,
    required this.BloodType,
  });

  @HiveField(0)
  String Governorate;

  @HiveField(1)
   String City;

  @HiveField(2)
   String BloodType;

  @HiveField(3)
  String Condition;

}