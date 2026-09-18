import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/auth_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback? mudarTema;
  final bool temaEscuro;

  const LoginScreen({
    super.key,
    this.mudarTema,
    this.temaEscuro = false,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usuarioController = TextEditingController();

  final TextEditingController senhaController = TextEditingController();

  final AuthService authService = AuthService();

  bool carregando = false;

  Future<void> entrar() async {
    if (usuarioController.text.isEmpty || senhaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha usuário e senha.'),
          backgroundColor: Color(0xFFB85C72),
        ),
      );

      return;
    }

    setState(() {
      carregando = true;
    });

    final resultado = await authService.login(
      usuarioController.text,
      senhaController.text,
    );

    setState(() {
      carregando = false;
    });

    if (resultado) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            mudarTema: widget.mudarTema,
            temaEscuro: widget.temaEscuro,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Acesso negado. Usuário ou senha incorretos.',
          ),
          backgroundColor: Color(0xFFB85C72),
        ),
      );
    }
  }

  @override
  void dispose() {
    usuarioController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 45,
            ),
            child: Column(
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8D7DA),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.edit_note_rounded,
                    size: 55,
                    color: Color(0xFFD98C9C),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Bem-vinda ♡',
                  style: GoogleFonts.poppins(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF6B4F3A),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Entre para acessar suas anotações',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Usuário',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6B4F3A),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: usuarioController,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu usuário',
                    prefixIcon: Icon(
                      Icons.person_outline,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Senha',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6B4F3A),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Digite sua senha',
                    prefixIcon: Icon(
                      Icons.lock_outline,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: carregando ? null : entrar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD98C9C),
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: carregando
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Entrar',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Autenticação pela API DummyJSON',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
