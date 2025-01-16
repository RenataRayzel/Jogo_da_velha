import 'package:flutter/material.dart';

void main() => runApp(JogoDaVelha());

class JogoDaVelha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Jogo da Velha')),
        body: Tabuleiro(),
      ),
    );
  }
}

class Tabuleiro extends StatefulWidget {
  @override
  _TabuleiroState createState() => _TabuleiroState();
}

class _TabuleiroState extends State<Tabuleiro> {
  List<String> _tabuleiro = List.filled(9, '');
  String _jogador = 'X';

  void _jogada(int index) {
    setState(() {
      if (_tabuleiro[index] == '') {
        _tabuleiro[index] = _jogador;
        if (!_verificaVencedor(_jogador)) {
          _trocaJogador();
        }
      }
    });
  }

  bool _verificaVencedor(String jogador) {
    List<List<int>> vitorias = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var vitoria in vitorias) {
      if (_tabuleiro[vitoria[0]] == jogador &&
          _tabuleiro[vitoria[1]] == jogador &&
          _tabuleiro[vitoria[2]] == jogador) {
        return true;
      }
    }
    return false;
  }

  void _trocaJogador() {
    _jogador = _jogador == 'X' ? 'O' : 'X';
  }

  @override
  Widget build(BuildContext context) {
    double _altura = MediaQuery.of(context).size.height * 0.5;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _jogada(index),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                _tabuleiro[index],
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
