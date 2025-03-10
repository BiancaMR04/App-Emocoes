import 'package:emocao_app/aluno.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'historico_aluno.dart';

class ListaAlunosScreen extends StatefulWidget {
  @override
  _ListaAlunosScreenState createState() => _ListaAlunosScreenState();
}

class _ListaAlunosScreenState extends State<ListaAlunosScreen> {
  final Box<Aluno> alunoBox = Hive.box<Aluno>('alunos');
  final TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  void adicionarAluno() {
    final nomeController = TextEditingController();
    final turmaController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Adicionar Aluno"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nomeController, decoration: InputDecoration(labelText: "Nome")),
            TextField(controller: turmaController, decoration: InputDecoration(labelText: "Turma")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final novoAluno = Aluno(nome: nomeController.text, turma: turmaController.text);
              alunoBox.add(novoAluno);
              Navigator.pop(context);
              setState(() {});
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Image.asset('assets/logoapae.png', height: 100),
          ],
        ),
        centerTitle: true,
      ),
      
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: adicionarAluno,
              icon: Icon(Icons.add, color: Colors.black),
              label: Text("Adicionar novo aluno", style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[100],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Buscar...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: alunoBox.length,
              itemBuilder: (context, index) {
                final aluno = alunoBox.getAt(index);
                if (aluno == null || !aluno.nome.toLowerCase().contains(searchQuery)&&
    !aluno.turma.toLowerCase().contains(searchQuery)) {
                  return SizedBox.shrink();
                }
                
                return Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                  ),
                  child: ListTile(
                    title: Text(aluno.nome, style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text("Turma: ${aluno.turma}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoricoAlunoScreen(aluno: aluno),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
