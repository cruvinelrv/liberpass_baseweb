import 'package:flutter/material.dart';

class CloseOrderPage extends StatefulWidget {
  const CloseOrderPage({super.key});

  @override
  State<CloseOrderPage> createState() => _CloseOrderPageState();
}

class _CloseOrderPageState extends State<CloseOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Imprimir Pedido'),
        ),
      ],
    );
  }
}
