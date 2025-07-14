import 'package:flutter/material.dart';
import 'package:lpass_web_dependencies/web_dependencies.dart';
import '../../cubits/onboarding_cubit/onboarding_cubit.dart';

class OnboardingStep2Page extends StatefulWidget {
  final VoidCallback onConfirm;
  const OnboardingStep2Page({super.key, required this.onConfirm});

  @override
  State<OnboardingStep2Page> createState() => _OnboardingStep2PageState();
}

class _OnboardingStep2PageState extends State<OnboardingStep2Page> {
  late final OnboardingCubit _onboarding_cubit;
  final _formKey = GlobalKey<FormState>();
  String? nome;
  String? sobrenome;
  String? email;
  String? senha;
  bool isLoading = false;
  String? errorText;

  @override
  void initState() {
    super.initState();
    _onboarding_cubit = Modular.get<OnboardingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passo 2: Dados Pessoais')),
      body: Container(
        color: const Color(0xFFF2F6FA),
        width: double.infinity,
        child: Center(
          child: Card(
            elevation: 8,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
              child: SizedBox(
                width: 400,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Preencha seus dados para cadastro', style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Nome'),
                        onChanged: (value) => nome = value,
                        validator: (value) => value == null || value.isEmpty ? 'Informe o nome' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Sobrenome'),
                        onChanged: (value) => sobrenome = value,
                        validator: (value) => value == null || value.isEmpty ? 'Informe o sobrenome' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => email = value,
                        validator: (value) => value == null || value.isEmpty ? 'Informe o email' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Senha'),
                        obscureText: true,
                        onChanged: (value) => senha = value,
                        validator: (value) => value == null || value.length < 6 ? 'Senha mínima de 6 caracteres' : null,
                      ),
                      const SizedBox(height: 24),
                      if (errorText != null) Text(errorText!, style: const TextStyle(color: Colors.red)),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () async {
                                  if (_formKey.currentState?.validate() != true) return;
                                  setState(() {
                                    isLoading = true;
                                    errorText = null;
                                  });
                                  _onboarding_cubit.updateNome('${nome ?? ''} ${sobrenome ?? ''}'.trim());
                                  _onboarding_cubit.updateEmail(email ?? '');
                                  _onboarding_cubit.updateSenha(senha ?? '');
                                  await _onboarding_cubit.criarUsuarioNoFirebase();
                                  final state = _onboarding_cubit.state;
                                  if (state.error != null) {
                                    setState(() {
                                      errorText = state.error;
                                      isLoading = false;
                                    });
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    widget.onConfirm();
                                  }
                                },
                          child: isLoading ? const CircularProgressIndicator() : const Text('Confirmar Cadastro'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
