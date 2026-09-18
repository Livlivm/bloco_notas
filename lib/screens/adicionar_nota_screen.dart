import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdicionarNotaScreen extends StatefulWidget {
  const AdicionarNotaScreen({super.key});

  @override
  State<AdicionarNotaScreen> createState() => _AdicionarNotaScreenState();
}

class _AdicionarNotaScreenState extends State<AdicionarNotaScreen> {
  final TextEditingController textoController = TextEditingController();

  void salvar() {
    if (textoController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Digite alguma coisa na anotação.'),
          backgroundColor: Color(0xFFB85C72),
        ),
      );

      return;
    }

    Navigator.pop(
      context,
      textoController.text.trim(),
    );
  }

  @override
  void dispose() {
    textoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nova anotação',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8D7DA),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.favorite_outline,
                    color: Color(0xFFD98C9C),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Escreva o que quiser ♡',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF6B4F3A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: textoController,
              maxLines: 9,
              decoration: InputDecoration(
                hintText: 'Digite sua anotação...',
                alignLabelWithHint: true,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: salvar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD98C9C),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Salvar anotação',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
