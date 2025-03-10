import 'package:emocao_app/emocao.dart';
import 'package:hive/hive.dart';

part 'aluno.g.dart';

@HiveType(typeId: 0)
class Aluno extends HiveObject {
  @HiveField(0)
  String nome;

  @HiveField(1)
  String turma;

  @HiveField(2)
  List<Emocao> emocoes = [];

  Aluno({required this.nome, required this.turma});
}
