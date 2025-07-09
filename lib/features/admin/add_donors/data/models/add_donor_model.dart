import 'package:hive/hive.dart';

part 'add_donor_model.g.dart';

@HiveType(typeId: 1)
class AddDonorModel extends HiveObject {
  AddDonorModel({
    required this.Name,
    required this.Age,
    required this.Phone,
    required this.Governorate,
    required this.City,
    required this.Condition,
    required this.BloodType,
    required this.LatestDonation
  });

  @HiveField(0)
  String Name;

  @HiveField(1)
  int Age;

  @HiveField(2)
  int Phone;

  @HiveField(3)
  String Governorate;

  @HiveField(4)
  String City;

  @HiveField(5)
  String BloodType;

  @HiveField(6)
  String Condition;
  
  @HiveField(7)
  DateTime LatestDonation;

}