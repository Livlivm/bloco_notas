class Nota {
  int? id;
  String texto;
  DateTime dataHora;

  Nota({
    this.id,
    required this.texto,
    required this.dataHora,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'texto': texto,
      'dataHora': dataHora.toIso8601String(),
    };
  }

  factory Nota.fromMap(Map<String, dynamic> map) {
    return Nota(
      id: map['id'],
      texto: map['texto'],
      dataHora: DateTime.parse(map['dataHora']),
    );
  }
}
