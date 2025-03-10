import 'package:emocao_app/emocao.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SelecionarEmocaoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> emocoes = [
    {"tipo": "Alegria", "descricao": "Quando você se sente muito feliz e quer sorrir ou brincar.", "cor": Colors.yellow[200], "imagem": "assets/alegria.png", "audio": "alegria.mp3"},
    {"tipo": "Tristeza", "descricao": "Quando algo te deixa chateado e você pode querer chorar ou ficar quieto.", "cor": Colors.blue[200], "imagem": "assets/tristeza.png", "audio": "tristeza.mp3"},
    {"tipo": "Raiva", "descricao": "Quando você fica bravo ou irritado porque algo te incomodou.", "cor": Colors.red[200], "imagem": "assets/raiva.png", "audio": "raiva.mp3"},
    {"tipo": "Tédio", "descricao": "Quando você não tem nada para fazer e começa a se sentir cansado ou entediado.", "cor": Colors.purple[200], "imagem": "assets/tedio.png", "audio": "tedio.mp3"},
    {"tipo": "Nojo", "descricao": "Quando algo é muito feio ou estranho, e você não quer chegar perto.", "cor": Colors.green[200], "imagem": "assets/nojo.png", "audio": "nojo.mp3"},
    {"tipo": "Ansiedade", "descricao": "Quando você fica preocupado com algo que pode acontecer e não consegue parar de pensar nisso.", "cor": Colors.orange[200], "imagem": "assets/ansiedade.png", "audio": "ansiedade.mp3"},
    {"tipo": "Inveja", "descricao": "Quando você quer algo que outra pessoa tem e isso pode te deixar triste ou chateado.", "cor": Colors.cyan[200], "imagem": "assets/inveja.png", "audio": "inveja.mp3"},
    {"tipo": "Medo", "descricao": "Quando você sente vontade de fugir ou se esconder porque algo parece assustador.", "cor": Colors.purple[100], "imagem": "assets/medo.png", "audio": "medo.mp3"},
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio(String audioPath) async {
    await _audioPlayer.play(AssetSource(audioPath));
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: emocoes.length,
          itemBuilder: (context, index) {
            final emocao = emocoes[index];
            return GestureDetector(
              onTap: () {
                Navigator.pop(context, Emocao(tipo: emocao['tipo'], data: DateTime.now()));
              },
              child: Card(
                color: emocao['cor'],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 130,
                            backgroundImage: AssetImage(emocao['imagem']),
                          ),
                          SizedBox(height: 12),
                          Text(emocao['tipo'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                          SizedBox(height: 6),
                          Text(
                            emocao['descricao'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: Icon(Icons.volume_up, color: Colors.black, size: 30),
                        onPressed: () => _playAudio(emocao['audio']),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
