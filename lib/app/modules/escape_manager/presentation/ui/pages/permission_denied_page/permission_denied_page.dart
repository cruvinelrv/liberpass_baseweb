import 'package:flutter/material.dart';

class PermissionDeniedPage extends StatelessWidget {
  const PermissionDeniedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liberpass')),
      body: const Center(
        child: Text('Permissão negada'),
      ),
    );
  }
}
