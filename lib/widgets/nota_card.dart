import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/nota.dart';

class NotaService {
  final String chave = 'anotacoes';

  Future<List<Nota>> buscarNotas() async {
    final prefs = await SharedPreferences.getInstance();

    final dados = prefs.getStringList(chave) ?? [];

    List<Nota> notas = [];

    for (String item in dados) {
      notas.add(
        Nota.fromMap(jsonDecode(item)),
      );
    }

    return notas;
  }

  Future<void> salvarNotas(List<Nota> notas) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> dados = [];

    for (Nota nota in notas) {
      dados.add(
        jsonEncode(nota.toMap()),
      );
    }

    await prefs.setStringList(chave, dados);
  }

  Future<void> adicionarNota(Nota nota) async {
    final notas = await buscarNotas();

    nota.id = DateTime.now().millisecondsSinceEpoch;

    notas.insert(0, nota);

    await salvarNotas(notas);
  }

  Future<void> excluirNota(int id) async {
    final notas = await buscarNotas();

    notas.removeWhere(
      (nota) => nota.id == id,
    );

    await salvarNotas(notas);
  }
}
