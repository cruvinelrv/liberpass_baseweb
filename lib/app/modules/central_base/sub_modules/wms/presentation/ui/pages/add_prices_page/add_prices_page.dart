import 'package:flutter/material.dart';

class AddPricesPage extends StatefulWidget {
  const AddPricesPage({super.key});

  @override
  State<AddPricesPage> createState() => _AddPricesPageState();
}

class _AddPricesPageState extends State<AddPricesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionando Novo Item - Produtos e Serviços'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Código do Item',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Unidade de Medida',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Preço de Venda',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Quantidade',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
