// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emocao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmocaoAdapter extends TypeAdapter<Emocao> {
  @override
  final int typeId = 1;

  @override
  Emocao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Emocao(
      tipo: fields[0] as String,
      data: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Emocao obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tipo)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmocaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
