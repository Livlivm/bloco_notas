import 'package:flutter/material.dart';

import '../models/nota.dart';

class NotaCard extends StatelessWidget {
  final Nota nota;
  final VoidCallback excluir;

  const NotaCard({
    super.key,
    required this.nota,
    required this.excluir,
  });

  String formatarData(DateTime data) {
    String dia = data.day.toString().padLeft(2, '0');
    String mes = data.month.toString().padLeft(2, '0');
    String ano = data.year.toString();

    String hora = data.hour.toString().padLeft(2, '0');
    String minuto = data.minute.toString().padLeft(2, '0');

    return '$dia/$mes/$ano • $hora:$minuto';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFF1D3D7),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD98C9C).withOpacity(0.10),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFF8D7DA),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.notes_rounded,
                color: Color(0xFFD98C9C),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatarData(nota.dataHora),
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFD98C9C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    nota.texto,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF6B4F3A),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: excluir,
              icon: const Icon(
                Icons.delete_outline_rounded,
                color: Color(0xFFB85C72),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
