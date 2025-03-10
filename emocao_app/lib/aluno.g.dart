// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlunoAdapter extends TypeAdapter<Aluno> {
  @override
  final int typeId = 0;

  @override
  Aluno read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Aluno(
      nome: fields[0] as String,
      turma: fields[1] as String,
    )..emocoes = (fields[2] as List).cast();
  }

  @override
  void write(BinaryWriter writer, Aluno obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.turma)
      ..writeByte(2)
      ..write(obj.emocoes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlunoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
