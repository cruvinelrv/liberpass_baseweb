import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _corporationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login - Liberpass 0.1.0'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  children: [
                    TextField(
                      controller: _corporationController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                      ],
                      onChanged: (value) {
                        _corporationController.text = value.toUpperCase();
                        _corporationController.selection =
                            TextSelection.fromPosition(TextPosition(offset: _corporationController.text.length));
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome da empresa',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _usernameController,
                      onChanged: (value) {
                        _usernameController.text = value.toUpperCase();
                        _usernameController.selection =
                            TextSelection.fromPosition(TextPosition(offset: _usernameController.text.length));
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Usuário',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                String corporation = _corporationController.text;
                String username = _usernameController.text;
                String password = _passwordController.text;
                switch (corporation) {
                  case 'PREMIER':
                    if (username == 'ADMIN' && password == '123456' && corporation == 'PREMIER') {
                      // Login bem-sucedido
                      Navigator.pushNamed(context, '/central-base');
                    } else {
                      // Login inválido

                      debugPrint('Invalid username or password');
                      Navigator.pushNamed(context, '/error');
                    }
                    break;
                  case 'INATOS':
                    if (username == 'VINICIUS' && password == '1803' && corporation == 'INATOS') {
                      // Login bem-sucedido
                      Navigator.pushNamed(context, '/central-base');
                    } else {
                      // Login inválido
                      debugPrint('Invalid username or password');
                      Navigator.pushNamed(context, '/error');
                    }
                    break;
                  default:
                    debugPrint('Invalid username or password');
                    Navigator.pushNamed(context, '/error');
                }
                // Aqui você pode fazer a validação do login e adicionar a lógica desejada
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
