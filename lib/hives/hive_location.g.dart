// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLocationAdapter extends TypeAdapter<HiveLocation> {
  @override
  final int typeId = 1;

  @override
  HiveLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLocation(
      stt: fields[0] as int,
      user: fields[1] as String?,
      cargoOrder: fields[2] as String?,
      lat: fields[3] as double?,
      long: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveLocation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.stt)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.cargoOrder)
      ..writeByte(3)
      ..write(obj.lat)
      ..writeByte(4)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
