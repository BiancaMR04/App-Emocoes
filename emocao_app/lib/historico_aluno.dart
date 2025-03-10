import 'package:emocao_app/aluno.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'selecionar_emocao.dart';

class HistoricoAlunoScreen extends StatefulWidget {
  final Aluno aluno;

  HistoricoAlunoScreen({required this.aluno});

  @override
  _HistoricoAlunoScreenState createState() => _HistoricoAlunoScreenState();
}

class _HistoricoAlunoScreenState extends State<HistoricoAlunoScreen> {
  void adicionarEmocao() async {
    final emocao = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelecionarEmocaoScreen()),
    );

    if (emocao != null) {
      setState(() {
        widget.aluno.emocoes.add(emocao);
        widget.aluno.save();
      });
    }
  }

  String formatarData(DateTime data) {
    final agora = DateTime.now();
    final ontem = agora.subtract(Duration(days: 1));
    final formato = DateFormat('dd/MM/yyyy HH:mm');
    
    if (data.year == ontem.year && data.month == ontem.month && data.day == ontem.day) {
      return "${formato.format(data)} (Ontem)";
    }
    return formato.format(data);
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nome:", style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(widget.aluno.nome),
                ),
                SizedBox(height: 8),
                Text("Turma:", style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(widget.aluno.turma),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: adicionarEmocao,
                  icon: Icon(Icons.add, color: Colors.black),
                  label: Text("Adicionar nova emoção", style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[100],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: widget.aluno.emocoes.length,
              separatorBuilder: (context, index) => Divider(color: Colors.grey.shade300),
              itemBuilder: (context, index) {
                final emocoesOrdenadas = widget.aluno.emocoes.reversed.toList();
                final emocao = emocoesOrdenadas[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListTile(
                    title: Text(emocao.tipo, style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(formatarData(emocao.data)),
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
