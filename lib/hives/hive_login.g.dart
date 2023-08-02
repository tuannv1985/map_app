// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_login.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLoginAdapter extends TypeAdapter<HiveLogin> {
  @override
  final int typeId = 2;

  @override
  HiveLogin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLogin(
      user: fields[0] as String?,
      pass: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveLogin obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.pass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLoginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
