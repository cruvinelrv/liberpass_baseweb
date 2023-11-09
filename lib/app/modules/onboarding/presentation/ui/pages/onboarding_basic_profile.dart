import 'package:flutter/material.dart';

class OnboardingBasicProfile extends StatefulWidget {
  const OnboardingBasicProfile({Key? key}) : super(key: key);

  @override
  State<OnboardingBasicProfile> createState() => _OnboardingBasicProfileState();
}

class _OnboardingBasicProfileState extends State<OnboardingBasicProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Sobrenome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(labelText: 'CPF'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  // Adicione lógica de validação de CPF, se necessário
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  // Adicione lógica de validação de email, se necessário
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  // Adicione lógica de validação de senha, se necessário
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Faça algo com os dados do formulário
                    // Por exemplo, navegue para a próxima tela ou envie para a API
                    // Você pode acessar os valores usando _nameController.text, _lastNameController.text, etc.
                  }
                },
                child: Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
