import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:liberpass_baseweb/app/modules/central_base/sub_modules/wms/domain/entities/entities.dart';

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
        stream: firestore.collection('itenspremier').snapshots(),
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
              final internalCode = documents[index]['internalCode'];
              final idCorp = documents[index]['idCorp'];
              final idCompanyCorp = documents[index]['idCompanyCorp'];
              final descriptionItem = documents[index]['descriptionItem'];
              final unitMeasure = documents[index]['unitMeasure'];
              final nameBrand = documents[index]['nameBrand'];
              final ncm = documents[index]['ncm'];
              final status = documents[index]['status'];
              final weight = documents[index]['weight'];
              final originItem = documents[index]['originItem'];
              final taxClassification = documents[index]['taxClassification'];
              final category = documents[index]['category'];
              final createdAt = documents[index]['createdAt'];
              final updatedAt = documents[index]['updateAt'];
              final List<dynamic> itemFlowData = documents[index]['listPrices'];
              final List<ItemFlowEntity> itemFlow = itemFlowData.map((data) => ItemFlowEntity.fromMap(data)).toList();

              return Card(
                color: Colors.blueGrey[100],
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListBody(
                  children: [
                    ListTile(
                      title: Text(
                        '$descriptionItem',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        'Código: $internalCode',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Text(
                        'R\$ ${itemFlow[0].salePrice}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/item-detail',
                          arguments: ItemEntity(
                            internalCode: internalCode,
                            idCorp: idCorp,
                            idCompanyCorp: idCompanyCorp,
                            descriptionItem: descriptionItem,
                            unitMeasure: unitMeasure,
                            nameBrand: nameBrand,
                            ncm: ncm,
                            status: status,
                            weight: weight,
                            originItem: originItem,
                            taxClassification: taxClassification,
                            category: category,
                            createdAt: createdAt,
                            updatedAt: updatedAt,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
