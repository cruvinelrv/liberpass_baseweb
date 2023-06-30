import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/central_base/sub_modules/crm/domain/entities/person_address_entity.dart';
import 'package:liberpass_baseweb/app/modules/central_base/sub_modules/scm/domain/entities/entities.dart';

import '../../../../domain/entities/person_entity.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pessoas'),
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
                Navigator.pushNamed(context, '/add-person');
              },
              icon: const Icon(Icons.add),
              label: const Text('Adicionar pessoa'),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('persons').snapshots(),
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
              final DocumentSnapshot document = documents[index];
              final documentId = document.id;
              final internalCode = documents[index]['internalCode'];
              final personType = documents[index]['personType'];
              final documentReference = documents[index]['documentReference'];
              final nameOrSocialReason = documents[index]['nameOrSocialReason'];
              final nickNameOrFantasyName = documents[index]['nickNameOrFantasyName'];
              final idCorp = documents[index]['idCorp'];
              final idCompanyCorp = documents[index]['idCompanyCorp'];
              final bornOrFoundationDate = documents[index]['bornOrFoundationDate'];
              final bornCity = documents[index]['bornCity'];
              final bornState = documents[index]['bornState'];
              final bornCountry = documents[index]['bornCountry'];
              final List<dynamic> personAddressEntity = documents[index]['listAddresses'];
              final List<PersonAddressEntity> itemAddress =
                  personAddressEntity.map((data) => PersonAddressEntity.fromMap(data)).toList();

              return Card(
                color: Colors.blueGrey[100],
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListBody(
                  children: [
                    ListTile(
                      title: Text(
                        'Código:$internalCode - $nameOrSocialReason - $documentReference',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          const Text(
                            'Endereço:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            ' ${itemAddress[0].streetName}, ${itemAddress[0].number}, ${itemAddress[0].district}, ${itemAddress[0].zipCode}, ${itemAddress[0].city} - ${itemAddress[0].state}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      trailing: Wrap(
                        children: [
                          const Text(
                            ' ',
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                _chamaDialogo(documentId);
                                //firestore.collection('persons').doc(documents[index].id).delete();
                              });
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        /*
                        Navigator.pushNamed(
                          context,
                          '/item-detail',
                          arguments: PersonEntity(
                            internalCode: internalCode,
                            personType: personType,
                            documentReference: documentReference,
                            nameOrSocialReason: nameOrSocialReason,
                            nickNameOrFantasyName: nickNameOrFantasyName,
                            idCorp: idCorp,
                            idCompanyCorp: idCompanyCorp,
                            bornOrFoundationDate: bornOrFoundationDate,
                            bornCity: bornCity,
                            bornState: bornState,
                            bornCountry: bornCountry,
                          ),
                        );
                        */
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

  Future<void> _chamaDialogo(String documentId) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar exclusão'),
          content: const Text('Tem certeza que deseja excluir essa pessoa?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Modular.to.pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                await firestore.collection('persons').doc(documentId).delete();
                Modular.to.pop();
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}
