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
  final TextEditingController _controllerDescriptionItem =
      TextEditingController();
  final TextEditingController _controllerSalePrice = TextEditingController();
  final TextEditingController _controllerMarginCost = TextEditingController();
  final TextEditingController _controllerMarginProfit = TextEditingController();
  final TextEditingController _controllerStock = TextEditingController();
  final TextEditingController _controllerGrid = TextEditingController();
  final TextEditingController _controllerBatch = TextEditingController();
  final TextEditingController _controllerWidthMeasure = TextEditingController();
  final TextEditingController _controllerSupplier = TextEditingController();
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
  final TextEditingController _controllerInternalCode = TextEditingController();
  final TextEditingController _controllerBrand = TextEditingController();
  final TextEditingController _controllerNcm = TextEditingController();
  final TextEditingController _controllerWeight = TextEditingController();
  final TextEditingController _controllerOrigin = TextEditingController();
  final TextEditingController _controllerTaxClassification =
      TextEditingController();
  final TextEditingController _controllerCategory = TextEditingController();
  final TextEditingController _controllerBarCode = TextEditingController();

  List<Map<String, dynamic>> listPrices = [];

  void _adicionarItem() {
    // Crie um mapa com os dados do novo item
    Map<String, dynamic> novoItem = {
      'idItem': _controllerIdItem.text,
      'internalCode': _controllerInternalCode.text,
      'idCorp': 1,
      'descriptionItem': _controllerDescriptionItem.text,
      'unitMeasure': _controllerUnitMeasure.text,
      'nameBrand': _controllerBrand.text,
      'ncm': _controllerNcm.text,
      'status': 'Ativo',
      'weight': double.tryParse(_controllerWeight.text),
      'originItem': _controllerOrigin.text,
      'taxClassification': _controllerTaxClassification.text,
      'category': _controllerCategory.text,
      'createdAt': DateTime.now().toString(),
      'updatedAt': DateTime.now().toString(),
      'barCode': _controllerBarCode.text,
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
      debugPrint('Novo item adicionado com ID: ${value.id}');
    }).catchError((error) {
      // Ocorreu um erro ao adicionar o item
      debugPrint('Erro ao adicionar o novo item: $error');
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
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        SizedBox(
                          width: 140,
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
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: _controllerDescriptionItem,
                            onChanged: (value) {
                              setState(() {
                                _controllerDescriptionItem.text =
                                    value.toUpperCase();
                                _controllerDescriptionItem.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _controllerDescriptionItem
                                            .text.length));
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
                        ),
                        const SizedBox(width: 8.0),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: _controllerBrand,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Marca',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _controllerBrand.text = value.toUpperCase();
                                _controllerBrand.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _controllerBrand.text.length));
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, informe a descrição da marca.';
                              }
                              if (value.length > 30) {
                                return 'A descrição do item deve ter no máximo 30 caracteres';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _controllerOrigin,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Origem do Item',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _controllerOrigin.text = value.toUpperCase();
                                _controllerOrigin.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _controllerOrigin.text.length));
                              });
                            },
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
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: _controllerTaxClassification,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Classificação Fiscal',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _controllerTaxClassification.text =
                                    value.toUpperCase();
                                _controllerTaxClassification.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _controllerTaxClassification
                                            .text.length));
                              });
                            },
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
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: _controllerWeight,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Peso',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, informe o peso';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: _controllerNcm,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'NCM',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, informe o código NCM';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: _controllerCategory,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Categoria',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _controllerCategory.text = value.toUpperCase();
                                _controllerCategory.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset:
                                            _controllerCategory.text.length));
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, informe a categoria do item';
                              }
                              if (value.length > 40) {
                                return 'A descrição do item deve ter no máximo 40 caracteres';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Visibility(
                      visible: true,
                      child: Column(
                        children: [
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
                                      child: Text(
                                          '${e.nameUnitMeasure} - ${e.alias}'),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              _controllerUnitMeasure.text = value.toString();
                            },
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
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
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: TextFormField(
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
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _idPrecoController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Identificador do Preço',
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
                                controller: _controllerPurchasePrice,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Compra',
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
                                controller: _controllerMarginCost,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Percentual de custos',
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
                                controller: _controllerCostPrice,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Custo',
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
                                controller: _controllerMarginProfit,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Margem de lucro',
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
                                controller: _controllerSalePrice,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Venda',
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
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _idPrecoController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Codigo Interno',
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
                            Expanded(
                              child: TextFormField(
                                controller: _controllerBatch,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Lote',
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
                                controller: _controllerGrid,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Grade',
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
                                controller: _controllerStock,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Estoque',
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
                                controller: _controllerSupplier,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Fornecedor',
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
                          ],
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
                                'Id: ${preco['idItemFlow']}, Valor: ${preco['salePrice']}, Descrição: ${preco['descriptionPrice']}, Ativo: ${preco['isActivePrice']}',
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 30.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formCadItemKey.currentState!.validate()) {
                            _adicionarItem();
                          }
                        },
                        child: const Text('SALVAR NOVO ITEM'),
                      ),
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
}
