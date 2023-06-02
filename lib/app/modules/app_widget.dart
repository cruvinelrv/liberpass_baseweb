import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liberpass - Sistema de gestão do ramo vidreiro',
      home: Scaffold(
        appBar: AppBar(
            title:
                const Text('Liberpass - Sistema de gestão do ramo vidreiro')),
        body: const Center(
          child: Text('Carregando...'),
        ),
      ),
    );
  }
}
