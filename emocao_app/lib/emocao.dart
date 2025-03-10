import 'package:hive/hive.dart';

part 'emocao.g.dart';

@HiveType(typeId: 1)
class Emocao extends HiveObject {
  @HiveField(0)
  String tipo;

  @HiveField(1)
  DateTime data;

  Emocao({required this.tipo, required this.data});
}
