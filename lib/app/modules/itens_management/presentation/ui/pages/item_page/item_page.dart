import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Itens - Produtos e Serviços'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[900],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/add-item');
              },
              icon: const Icon(Icons.add),
              label: const Text('Adicionar Item'),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('itens').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final idItem = documents[index]['idItem'];
              final unitMeasure = documents[index]['unitMeasure'];
              final description = documents[index]['description'];
              final salePrice = documents[index]['salePrice'];
              final quantity = documents[index]['quantity'];

              //final List<ListPricesEntity> listPricesEntity = [];
              return Card(
                color: Colors.blueGrey[100],
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Text(
                    'Código: $idItem - $description - $unitMeasure',
                    style: const TextStyle(fontSize: 24),
                  ),
                  subtitle: Text(
                    'Estoque: $quantity - Preço de Venda R\$${salePrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
