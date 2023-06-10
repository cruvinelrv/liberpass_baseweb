import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liberpass_baseweb/app/modules/shared/enums/enum_unit_measure.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formCadItemKey = GlobalKey<FormState>();
  final TextEditingController _controllerUnitMeasure = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerSalePrice = TextEditingController();
  final TextEditingController _controllerQuantity = TextEditingController();
  final TextEditingController _controllerWidthMeasure = TextEditingController();
  final TextEditingController _controllerHeightMeasure =
      TextEditingController();
  final TextEditingController _controllerCostPrice = TextEditingController();
  final TextEditingController _controllerPurchasePrice =
      TextEditingController();
  final TextEditingController _controllerIdItem = TextEditingController();
  final TextEditingController _idPrecoController = TextEditingController();
  final TextEditingController _valorPrecoController = TextEditingController();
  final TextEditingController _descricaoPrecoController =
      TextEditingController();
  List<Map<String, dynamic>> listPrices = [];

  void _adicionarItem() {
    // Crie um mapa com os dados do novo item
    Map<String, dynamic> novoItem = {
      'idItem': _controllerIdItem.text,
      'description': _controllerDescription.text,
      'salePrice': _controllerSalePrice.text,
      'purchasePrice': _controllerPurchasePrice.text,
      'costPrice': _controllerCostPrice.text,
      'quantity': _controllerQuantity.text,
      'unitMeasure': _controllerUnitMeasure.text,
      'widthMeasure': _controllerWidthMeasure.text,
      'heightMeasure': _controllerHeightMeasure.text,
      'listPrices': [
        {}..addAll({
            'idPreco': _idPrecoController.text,
            'valorPreco': _valorPrecoController.text,
            'descricaoPreco': _descricaoPrecoController.text,
          })
      ],
    };

    // Adicione o novo item à coleção 'itens'
    _firestore.collection('itens').add(novoItem).then((value) {
      // Item adicionado com sucesso
      print('Novo item adicionado com ID: ${value.id}');
    }).catchError((error) {
      // Ocorreu um erro ao adicionar o item
      print('Erro ao adicionar o novo item: $error');
    });
  }

  void _adicionarPreco() {
    final idPreco = _idPrecoController.text.trim();
    final valorPreco = double.tryParse(_valorPrecoController.text.trim());
    final descricaoPreco = _descricaoPrecoController.text.trim();
    if (idPreco.isNotEmpty && valorPreco != null && descricaoPreco.isNotEmpty) {
      final novoPreco = {
        'idPrice': idPreco,
        'valuePrice': valorPreco,
        'descriptionPrice': descricaoPreco,
        'isActivePrice': true,
      };
      listPrices.add(novoPreco);
      _idPrecoController.clear();
      _valorPrecoController.clear();
      _descricaoPrecoController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionando Novo Item - Produtos e Serviços'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formCadItemKey,
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: TextFormField(
                        controller: _idPrecoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ID do Preço',
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
                        controller: _valorPrecoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Valor do Preço',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Valor inválido';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextFormField(
                        controller: _descricaoPrecoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Descrição do Preço',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _adicionarPreco,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _controllerIdItem,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Código do Item',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe o código do item';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _controllerDescription,
                  onChanged: (value) {
                    setState(() {
                      _controllerDescription.text = value.toUpperCase();
                      _controllerDescription.selection =
                          TextSelection.fromPosition(TextPosition(
                              offset: _controllerDescription.text.length));
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descrição do Item',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe a descrição do item';
                    }
                    if (value.length > 60) {
                      return 'A descrição do item deve ter no máximo 60 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _controllerSalePrice,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Preço de Venda',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe o preço de venda';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _controllerPurchasePrice,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Preço de Compra',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe o preço de compra';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _controllerCostPrice,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Preço de Custo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe o preço de custo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _controllerQuantity,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Quantidade',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe a quantidade';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField(
                  isExpanded: true,
                  isDense: true,
                  itemHeight: 48.0,
                  validator: (value) {
                    if (value == null) {
                      return 'Selecione uma Unidade de Medida';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Unidade de Medida',
                  ),
                  items: EnumUnitMeasure.values
                      .map((e) => DropdownMenuItem(
                            value: e.alias,
                            child: Text('${e.nameUnitMeasure} - ${e.alias}'),
                          ))
                      .toList(),
                  onChanged: (value) {
                    _controllerUnitMeasure.text = value.toString();
                  },
                ),
                Visibility(
                  visible: true,
                  child: Column(
                    children: [
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _controllerWidthMeasure,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Largura',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, informe a largura';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _controllerHeightMeasure,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Altura',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, informe a altura';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _idPrecoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ID do Preço',
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
                        controller: _valorPrecoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Valor do Preço',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Valor inválido';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextFormField(
                        controller: _descricaoPrecoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Descrição do Preço',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _adicionarPreco,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Text('Preços adicionados:'),
                Column(
                  children: listPrices
                      .map((preco) => Text(
                            'ID: ${preco['idPrice']}, Valor: ${preco['valuePrice']}, Descrição: ${preco['descriptionPrice']}, Ativo: ${preco['isActivePrice']}',
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formCadItemKey.currentState!.validate()) {
                      _adicionarItem();
                    }
                  },
                  child: const Text('SALVAR NOVO ITEM'),
                ),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
