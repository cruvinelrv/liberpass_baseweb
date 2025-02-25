// step1_page.dart

import 'package:flutter/material.dart';

class Step2Page extends StatelessWidget {
  final VoidCallback onNext;

  const Step2Page({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passo 2')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adicione aqui os campos do formulário do Passo 1
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onNext,
              child: const Text('Próximo'),
            ),
          ],
        ),
      ),
    );
  }
}
