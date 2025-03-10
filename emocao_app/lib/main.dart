import 'package:emocao_app/aluno.dart';
import 'package:emocao_app/emocao.dart';
import 'package:emocao_app/lista_alunos.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  Hive.registerAdapter(AlunoAdapter());
  Hive.registerAdapter(EmocaoAdapter());

  await Hive.openBox<Aluno>('alunos');
  await Hive.openBox<Emocao>('emocoes');

  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListaAlunosScreen(),
    );
  }
}
