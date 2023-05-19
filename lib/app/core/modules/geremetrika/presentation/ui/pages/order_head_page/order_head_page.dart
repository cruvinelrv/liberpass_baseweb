import 'package:flutter/material.dart';

class OrderHeadPage extends StatefulWidget {
  const OrderHeadPage({super.key});

  @override
  State<OrderHeadPage> createState() => _OrderHeadPageState();
}

class _OrderHeadPageState extends State<OrderHeadPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Cliente',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Fone',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Endereço',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Data',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Condição de pagamento',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
