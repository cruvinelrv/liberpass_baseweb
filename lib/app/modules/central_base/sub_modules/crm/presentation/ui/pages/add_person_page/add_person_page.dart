import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/shared/enums/enums.dart';

import '../../../../domain/entities/person_address_entity.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({super.key});

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> with SingleTickerProviderStateMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formCadPersonKey = GlobalKey<FormState>();
  final TextEditingController _controllerPersonType = TextEditingController();
  final TextEditingController _controllerDocumentReference = TextEditingController();
  final TextEditingController _controllerNameSocialReason = TextEditingController();
  final TextEditingController _controllerNicknameFantasy = TextEditingController();
  final TextEditingController _controllerIdCorp = TextEditingController();
  final TextEditingController _controllerIdCompanyCorp = TextEditingController();
  final TextEditingController _controllerInternalCode = TextEditingController();
  final TextEditingController _controllerTypeAddress = TextEditingController();
  final TextEditingController _controllerZipCode = TextEditingController();
  final TextEditingController _controllerStreetName = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();
  final TextEditingController _controllerComplement = TextEditingController();
  final TextEditingController _controllerDistrict = TextEditingController();
  final TextEditingController _controllerAddressCity = TextEditingController();
  final TextEditingController _controllerAddressState = TextEditingController();
  final TextEditingController _controllerAddressCountry = TextEditingController();
  final TextEditingController _controllerReference = TextEditingController();
  final TextEditingController _controllerLatitud = TextEditingController();
  final TextEditingController _controllerLongitud = TextEditingController();
  final TextEditingController _controllerObs = TextEditingController();
  final TextEditingController _controllerBornState = TextEditingController();
  final TextEditingController _controllerBornDate = TextEditingController();
  final TextEditingController _controllerBornCity = TextEditingController();
  final TextEditingController _controllerBornCountry = TextEditingController();
  late final EnumTypeAddress typeAddressValue;
  EnumTypePerson typePersonValue = EnumTypePerson.PF;
  List<Map<String, dynamic>> listDocuments = [];
  List<Map<String, dynamic>> listAddresses = [];
  List<Map<String, dynamic>> listContacts = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addPerson() {
    // Crie um mapa com os dados do novo item
    Map<String, dynamic> newPerson = {
      'internalCode': _controllerInternalCode.text,
      'personType': _controllerPersonType.text,
      'documentReference': _controllerDocumentReference.text,
      'nameOrSocialReason': _controllerNameSocialReason.text,
      'nickNameOrFantasyName': _controllerNicknameFantasy.text,
      'idCorp': _controllerIdCorp.text,
      'idCompanyCorp': _controllerIdCompanyCorp.text,
      'bornOrFoundationDate': _controllerBornDate.text,
      'bornCity': _controllerBornCity.text,
      'bornState': _controllerBornState.text,
      'bornCountry': _controllerBornCountry.text,

      //'listDocuments': List.from(listDocuments),
      'listAddresses': List.from(listAddresses),
      //'listContacts': List.from(listContacts),
    };

    // Adicione o novo item à coleção 'itens'
    _firestore.collection('persons').add(newPerson).then((value) {
      // Item adicionado com sucesso
      debugPrint('Nova pessoa adicionada com ID: ${value.id}');
    }).catchError((error) {
      // Ocorreu um erro ao adicionar o item
      debugPrint('Erro ao adicionar a nova pessoa: $error');
    });
  }

  void _newAddAddress(PersonAddressEntity address) {
    final newAddressMap = address.toJson();

    setState(() {
      listAddresses.add(newAddressMap);
    });
    debugPrint('Novo endereço Adicionado: $newAddressMap');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionando nova pessoa - Cadastro de Pessoas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formCadPersonKey,
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: 4.0),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                isDense: true,
                                itemHeight: 48.0,
                                validator: (value) {
                                  if (value == null) {
                                    return 'Selecione o tipo de pessoa';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Tipo de pessoa: Física ou Jurídica',
                                ),
                                items: EnumTypePerson.values
                                    .map((e) => DropdownMenuItem(
                                          value: e.nameTypePerson,
                                          child: Text('${e.nameTypePerson} '),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  typePersonValue =
                                      EnumTypePerson.values.firstWhere((element) => element.nameTypePerson == value);
                                  _controllerPersonType.text = typePersonValue.nameTypePerson;
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            SizedBox(
                              width: 180,
                              child: TextFormField(
                                controller: _controllerDocumentReference,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Documento Principal',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            SizedBox(
                              width: 180,
                              child: TextFormField(
                                controller: _controllerInternalCode,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Código Interno',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _controllerNameSocialReason,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nome ou Razão Social',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                controller: _controllerNicknameFantasy,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Apelido ou Nome Fantasia',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Visibility(
                          visible: false,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 180,
                                child: TextFormField(
                                  controller: _controllerBornDate,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Data de Nascimento',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Campo obrigatório';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: TextFormField(
                                  controller: _controllerBornCity,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Cidade de Nascimento',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: TextFormField(
                                  controller: _controllerBornState,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Estado de Nascimento',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _controllerBornCountry,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'País de Nascimento',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(),
                        const SizedBox(height: 8),
                        Text(
                          'Informações de Endereço',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(
                              width: 180,
                              child: TextFormField(
                                controller: _controllerZipCode,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CEP',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                controller: _controllerStreetName,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Logradouro',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            SizedBox(
                              width: 180,
                              child: TextFormField(
                                controller: _controllerNumber,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Número',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                controller: _controllerComplement,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Complemento',
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                controller: _controllerDistrict,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Bairro',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _controllerAddressCity,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Cidade',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                controller: _controllerAddressState,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Estado',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                controller: _controllerAddressCountry,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'País',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField(
                          isExpanded: true,
                          isDense: true,
                          itemHeight: 48.0,
                          validator: (value) {
                            if (value == null) {
                              return 'Selecione o tipo de endereço';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Tipo de Endereço',
                          ),
                          items: EnumTypeAddress.values
                              .map((e) => DropdownMenuItem(
                                    value: e.nameTypeAddress,
                                    child: Text('${e.nameTypeAddress} '),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            typeAddressValue =
                                EnumTypeAddress.values.firstWhere((element) => element.nameTypeAddress == value);
                            _controllerTypeAddress.text = typeAddressValue.nameTypeAddress;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        ElevatedButton.icon(
                          label: const Text('Adicionar Endereço'),
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            final personAddress = PersonAddressEntity(
                              idAddress: 1,
                              typeAddress: _controllerTypeAddress.text,
                              zipCode: _controllerZipCode.text,
                              streetName: _controllerStreetName.text,
                              number: _controllerNumber.text,
                              complement: _controllerComplement.text,
                              district: _controllerDistrict.text,
                              city: _controllerAddressCity.text,
                              state: _controllerAddressState.text,
                              country: _controllerAddressCountry.text,
                              reference: '',
                              latitud: '',
                              longitud: '',
                              obs: '',
                            );
                            _newAddAddress(personAddress);
                            if (_formCadPersonKey.currentState!.validate()) {}
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Endereços adicionados:'),
                    Container(
                      color: Colors.grey[200],
                      height: 100, // Defina uma altura adequada para a lista
                      child: ListView.builder(
                        itemCount: listAddresses.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = listAddresses[index];

                          return ListTile(
                            title: Text(item['typeAddress']),
                            subtitle: Text(item['streetName'] + ' - ' + item['number'] + ' - ' + item['district']),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  listAddresses.removeAt(index);
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formCadPersonKey.currentState!.validate()) {
                          _addPerson();
                          _clearFields();
                          Modular.to.navigate('/central-base/crm');
                        }
                      },
                      child: const Text('SALVAR PESSOA'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearFields() {
    _controllerTypeAddress.clear();
    _controllerDocumentReference.clear();
    _controllerPersonType.clear();
    _controllerNameSocialReason.clear();
    _controllerNicknameFantasy.clear();
    _controllerZipCode.clear();
    _controllerStreetName.clear();
    _controllerNumber.clear();
    _controllerComplement.clear();
    _controllerDistrict.clear();
    _controllerAddressCity.clear();
    _controllerAddressState.clear();
    _controllerAddressCountry.clear();
    _controllerReference.clear();
    _controllerLatitud.clear();
    _controllerLongitud.clear();
    _controllerObs.clear();
    listAddresses.clear();
  }
}
