import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Liberpass - Sistema de gestão do ramo vidreiro')),
      body: const Center(
        child: Text('Um erro aconteceu'),
      ),
    );
  }
}
