import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/nota.dart';
import '../services/nota_service.dart';
import '../widgets/nota_card.dart';
import 'adicionar_nota_screen.dart';
import 'splash_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? mudarTema;
  final bool temaEscuro;

  const HomeScreen({
    super.key,
    this.mudarTema,
    this.temaEscuro = false,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotaService notaService = NotaService();

  List<Nota> notas = [];

  @override
  void initState() {
    super.initState();

    carregarNotas();
  }

  Future<void> carregarNotas() async {
    final resultado = await notaService.buscarNotas();

    setState(() {
      notas = resultado;
    });
  }

  Future<void> adicionarNota() async {
    final texto = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AdicionarNotaScreen(),
      ),
    );

    if (texto != null) {
      final nota = Nota(
        texto: texto,
        dataHora: DateTime.now(),
      );

      await notaService.adicionarNota(nota);

      await carregarNotas();
    }
  }

  Future<void> excluirNota(Nota nota) async {
    if (nota.id != null) {
      await notaService.excluirNota(nota.id!);

      await carregarNotas();
    }
  }

  void abrirSplash() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SplashScreen(
          mudarTema: widget.mudarTema,
          temaEscuro: widget.temaEscuro,
        ),
      ),
    );
  }

  void sair() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minhas anotações',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: widget.mudarTema,
            icon: Icon(
              widget.temaEscuro
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF8D7DA),
                    Color(0xFFD98C9C),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.edit_note_rounded,
                        size: 45,
                        color: Color(0xFFD98C9C),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Anotações',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'suas ideias em um só lugar',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.note_alt_outlined,
                color: Color(0xFFD98C9C),
              ),
              title: const Text('Minhas anotações'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.auto_awesome,
                color: Color(0xFFD98C9C),
              ),
              title: const Text('Splash'),
              onTap: () {
                Navigator.pop(context);
                abrirSplash();
              },
            ),
            ListTile(
              leading: Icon(
                widget.temaEscuro ? Icons.light_mode : Icons.dark_mode,
                color: const Color(0xFFD98C9C),
              ),
              title: Text(
                widget.temaEscuro ? 'Tema claro' : 'Tema escuro',
              ),
              onTap: () {
                Navigator.pop(context);

                if (widget.mudarTema != null) {
                  widget.mudarTema!();
                }
              },
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: Color(0xFFB85C72),
              ),
              title: const Text(
                'Sair',
                style: TextStyle(
                  color: Color(0xFFB85C72),
                ),
              ),
              onTap: sair,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
      body: notas.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8D7DA),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.note_alt_outlined,
                      size: 55,
                      color: Color(0xFFD98C9C),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Nenhuma anotação ainda',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF6B4F3A),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Clique no + para escrever algo ♡',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notas.length,
              itemBuilder: (context, index) {
                final nota = notas[index];

                return NotaCard(
                  nota: nota,
                  excluir: () {
                    excluirNota(nota);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: adicionarNota,
        child: const Icon(
          Icons.add_rounded,
          size: 30,
        ),
      ),
    );
  }
}
