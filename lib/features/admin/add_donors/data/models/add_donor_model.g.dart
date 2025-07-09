// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_donor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddDonorModelAdapter extends TypeAdapter<AddDonorModel> {
  @override
  final int typeId = 1;

  @override
  AddDonorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddDonorModel(
      Name: fields[0] as String,
      Age: fields[1] as int,
      Phone: fields[2] as int,
      Governorate: fields[3] as String,
      City: fields[4] as String,
      Condition: fields[6] as String,
      BloodType: fields[5] as String,
      LatestDonation: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AddDonorModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.Name)
      ..writeByte(1)
      ..write(obj.Age)
      ..writeByte(2)
      ..write(obj.Phone)
      ..writeByte(3)
      ..write(obj.Governorate)
      ..writeByte(4)
      ..write(obj.City)
      ..writeByte(5)
      ..write(obj.BloodType)
      ..writeByte(6)
      ..write(obj.Condition)
      ..writeByte(7)
      ..write(obj.LatestDonation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddDonorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
