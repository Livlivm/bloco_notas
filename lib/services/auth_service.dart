import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  final String url = 'https://dummyjson.com/auth/login';

  Future<bool> login(String username, String password) async {
    try {
      final resposta = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username.trim(),
          'password': password.trim(),
          'expiresInMins': 30,
        }),
      );

      print('STATUS: ${resposta.statusCode}');
      print('RESPOSTA: ${resposta.body}');

      if (resposta.statusCode == 200) {
        return true;
      }

      return false;
    } catch (erro) {
      print('ERRO: $erro');
      return false;
    }
  }
}
