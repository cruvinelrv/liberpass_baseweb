import 'package:flutter/material.dart';

class ItensPage extends StatefulWidget {
  const ItensPage({super.key});

  @override
  State<ItensPage> createState() => _ItensPageState();
}

class _ItensPageState extends State<ItensPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('Item $index'),
            subtitle: Text('Subtitulo $index'),
            trailing: const Text('R\$ 10,00'),
          ),
        );
      },
    );
  }
}
