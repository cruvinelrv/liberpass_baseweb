import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/shared/enums/enum_unit_measure.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../domain/entities/item_flow_entity.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formCadItemKey = GlobalKey<FormState>();
  final TextEditingController _controllerUnitMeasure = TextEditingController();
  final TextEditingController _controllerDescriptionItem = TextEditingController();
  final TextEditingController _controllerSalePrice = TextEditingController();
  final TextEditingController _controllerMarginCost = TextEditingController();
  final TextEditingController _controllerMarginProfit = TextEditingController();
  final TextEditingController _controllerStock = TextEditingController();
  final TextEditingController _controllerGrid = TextEditingController();
  final TextEditingController _controllerBatch = TextEditingController();
  final TextEditingController _controllerWidthMeasure = TextEditingController();
  final TextEditingController _controllerSupplier = TextEditingController();
  final TextEditingController _controllerHeightMeasure = TextEditingController();
  final TextEditingController _controllerCostPrice = TextEditingController();
  final TextEditingController _controllerPurchasePrice = TextEditingController();
  final TextEditingController _controllerIdItem = TextEditingController();
  final TextEditingController _controllerIdPrice = TextEditingController();
  final TextEditingController _controllerDescriptionPrice = TextEditingController();
  final TextEditingController _controllerInternalCode = TextEditingController();
  final TextEditingController _controllerBrand = TextEditingController();
  final TextEditingController _controllerNcm = TextEditingController();
  final TextEditingController _controllerWeight = TextEditingController();
  final TextEditingController _controllerOrigin = TextEditingController();
  final TextEditingController _controllerTaxClassification = TextEditingController();
  final TextEditingController _controllerCategory = TextEditingController();
  final TextEditingController _controllerBarCode = TextEditingController();
  final TextEditingController _controllerStatus = TextEditingController();
  List<Map<String, dynamic>> listPrices = [];
  late final FocusNode focus;
  late final FocusNode focusInternalCode;
  late final FocusNode focusDescriptionItem;
  late final FocusNode focusBrand;
  late final FocusNode focusOriginItem;
  late final FocusNode focusTaxClassification;
  late final FocusNode focusWeight;
  late final FocusNode focusNcm;
  late final FocusNode focusCategory;
  late final FocusNode focusUnitMeasure;
  late final FocusNode focusWidthMeasure;
  late final FocusNode focusHeightMeasure;
  late final FocusNode focusIdPrice;
  late final FocusNode focusPurchasePrice;
  late final FocusNode focusMarginCost;
  late final FocusNode focusCostPrice;
  late final FocusNode focusMarginProfit;
  late final FocusNode focusSalePrice;
  late final FocusNode focusDescriptionPrice;
  late final FocusNode focusInternalCodePrice;
  late final FocusNode focusBatch;
  late final FocusNode focusGrid;
  late final FocusNode focusStock;
  late final FocusNode focusSupplier;
  late final FocusNode focusStatus;
  late final FocusNode focusAddButton;
  late final FocusNode focusBarCode;

  @override
  void initState() {
    super.initState();
    focus = FocusNode();
    focusInternalCode = FocusNode()..requestFocus();
    focusDescriptionItem = FocusNode();
    focusBrand = FocusNode();
    focusOriginItem = FocusNode();
    focusTaxClassification = FocusNode();
    focusWeight = FocusNode();
    focusNcm = FocusNode();
    focusCategory = FocusNode();
    focusUnitMeasure = FocusNode();
    focusWidthMeasure = FocusNode();
    focusHeightMeasure = FocusNode();
    focusIdPrice = FocusNode();
    focusPurchasePrice = FocusNode();
    focusMarginCost = FocusNode();
    focusCostPrice = FocusNode();
    focusMarginProfit = FocusNode();
    focusSalePrice = FocusNode();
    focusDescriptionPrice = FocusNode();
    focusInternalCodePrice = FocusNode();
    focusBatch = FocusNode();
    focusGrid = FocusNode();
    focusStock = FocusNode();
    focusSupplier = FocusNode();
    focusStatus = FocusNode();
    focusBarCode = FocusNode();
    focusAddButton = FocusNode();
  }

  @override
  void dispose() {
    focus.dispose();
    focusInternalCode.dispose();
    focusDescriptionItem.dispose();
    focusBrand.dispose();
    focusOriginItem.dispose();
    focusTaxClassification.dispose();
    focusWeight.dispose();
    focusNcm.dispose();
    focusCategory.dispose();
    focusUnitMeasure.dispose();
    focusWidthMeasure.dispose();
    focusHeightMeasure.dispose();
    focusIdPrice.dispose();
    focusPurchasePrice.dispose();
    focusMarginCost.dispose();
    focusCostPrice.dispose();
    focusMarginProfit.dispose();
    focusSalePrice.dispose();
    focusDescriptionPrice.dispose();
    focusInternalCodePrice.dispose();
    focusBatch.dispose();
    focusGrid.dispose();
    focusStock.dispose();
    focusSupplier.dispose();
    focusStatus.dispose();
    focusBarCode.dispose();
    focusAddButton.dispose();
    super.dispose();
  }

  void _adicionarItem() {
    //var ItemEntity item =
    /*
    ItemEntity(
      idItem: _controllerIdItem.text,
      internalCode: _controllerInternalCode.text,
      idCorp: 1,
      idCompanyCorp: 1,
      descriptionItem: _controllerDescriptionItem.text,
      unitMeasure: _controllerUnitMeasure.text,
      nameBrand: _controllerBrand.text,
      ncm: _controllerNcm.text,
      status: 'Ativo',
      weight: double.tryParse(_controllerWeight.text),
      originItem: _controllerOrigin.text,
      taxClassification: _controllerTaxClassification.text,
      category: _controllerCategory.text,
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
      barCode: _controllerBarCode.text, //ok
      listPrices: List.from(listPrices),
    );
    */
    // Crie um mapa com os dados do novo item1
    Map<String, dynamic> novoItem = {
      'idItem': 1,
      'internalCode': _controllerInternalCode.text,
      'idCorp': 1,
      'idCompanyCorp': 1,
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
      'barCode': _controllerBarCode.text, //ok
      'listPrices': List.from(listPrices),
    };

    // Adicione o novo item à coleção 'itens'
    _firestore.collection('itens_premier').add(novoItem).then((value) {
      // Item adicionado com sucesso
      debugPrint('Novo item adicionado com ID: ${value.id}');
    }).catchError((error) {
      // Ocorreu um erro ao adicionar o item
      debugPrint('Erro ao adicionar o novo item: $error');
    });
  }

  void _novoAdicionarPreco(ItemFlowEntity price) {
    final newPriceMap = price.toJson();

    setState(() {
      listPrices.add(newPriceMap);
    });
    debugPrint('Novo Preço Adicionado: $newPriceMap');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionando Novo Item - Produtos e Serviços'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
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
                            focusNode: focusInternalCode,
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
                            onEditingComplete: () {
                              focusDescriptionItem.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            focusNode: focusDescriptionItem,
                            controller: _controllerDescriptionItem,
                            onChanged: (value) {
                              setState(() {
                                _controllerDescriptionItem.text = value.toUpperCase();
                                _controllerDescriptionItem.selection = TextSelection.fromPosition(
                                    TextPosition(offset: _controllerDescriptionItem.text.length));
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
                            onEditingComplete: () {
                              focusStatus.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            focusNode: focusStatus,
                            controller: _controllerStatus,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Status',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, informe a status do item';
                              }
                              if (value.length > 8) {
                                return 'A descrição do item deve ter no máximo 8 caracteres';
                              }
                              return null;
                            },
                            onEditingComplete: () {
                              focusBrand.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            focusNode: focusBrand,
                            controller: _controllerBrand,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Marca',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _controllerBrand.text = value.toUpperCase();
                                _controllerBrand.selection =
                                    TextSelection.fromPosition(TextPosition(offset: _controllerBrand.text.length));
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
                            onEditingComplete: () {
                              focusOriginItem.requestFocus();
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
                            focusNode: focusOriginItem,
                            controller: _controllerOrigin,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Origem do Item',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _controllerOrigin.text = value.toUpperCase();
                                _controllerOrigin.selection =
                                    TextSelection.fromPosition(TextPosition(offset: _controllerOrigin.text.length));
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
                            onEditingComplete: () {
                              focusTaxClassification.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            focusNode: focusTaxClassification,
                            controller: _controllerTaxClassification,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Classificação Fiscal',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _controllerTaxClassification.text = value.toUpperCase();
                                _controllerTaxClassification.selection = TextSelection.fromPosition(
                                    TextPosition(offset: _controllerTaxClassification.text.length));
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
                            onEditingComplete: () {
                              focusWeight.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            focusNode: focusWeight,
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
                            onEditingComplete: () {
                              focusNcm.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            focusNode: focusNcm,
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
                            onEditingComplete: () {
                              focusCategory.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            focusNode: focusCategory,
                            controller: _controllerCategory,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Categoria',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _controllerCategory.text = value.toUpperCase();
                                _controllerCategory.selection =
                                    TextSelection.fromPosition(TextPosition(offset: _controllerCategory.text.length));
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
                            onEditingComplete: () {
                              focusUnitMeasure.requestFocus();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 300,
                              child: DropdownButtonFormField(
                                focusNode: focusUnitMeasure,
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
                                  focusWidthMeasure.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusWidthMeasure,
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
                                onEditingComplete: () {
                                  focusHeightMeasure.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusHeightMeasure,
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
                                onEditingComplete: () {
                                  focusIdPrice.requestFocus();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                focusNode: focusIdPrice,
                                controller: _controllerIdPrice,
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
                                onEditingComplete: () {
                                  focusPurchasePrice.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusPurchasePrice,
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
                                onEditingComplete: () {
                                  focusMarginCost.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusMarginCost,
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
                                onEditingComplete: () {
                                  focusCostPrice.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusCostPrice,
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
                                onEditingComplete: () {
                                  focusMarginProfit.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusMarginProfit,
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
                                onEditingComplete: () {
                                  focusSalePrice.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusSalePrice,
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
                                onEditingComplete: () {
                                  focusDescriptionPrice.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusDescriptionPrice,
                                controller: _controllerDescriptionPrice,
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
                                onEditingComplete: () {
                                  focusInternalCodePrice.requestFocus();
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
                                focusNode: focusInternalCodePrice,
                                controller: _controllerInternalCode,
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
                                onEditingComplete: () {
                                  focusBatch.requestFocus();
                                },
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusBatch,
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
                                onEditingComplete: () {
                                  focusGrid.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusGrid,
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
                                onEditingComplete: () {
                                  focusStock.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusStock,
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
                                onEditingComplete: () {
                                  focusSupplier.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusSupplier,
                                controller: _controllerSupplier,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Fornecedor',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  return null;
                                },
                                onEditingComplete: () {
                                  focusAddButton.requestFocus();
                                },
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          focusNode: focusAddButton,
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            final itemFlow = ItemFlowEntity(
                              createdAt: Timestamp.now(), //ok
                              updatedAt: Timestamp.now(), //ok
                              isActivePrice: true, //ok
                              idCompanyCorp: 1, //ok
                              idCorp: 1, //ok
                              idItemFlow: 1,
                              purchasePrice: double.parse(_controllerCostPrice.text), //ok
                              marginCost: double.parse(_controllerMarginProfit.text), //ok
                              costPrice: double.parse(_controllerCostPrice.text), //ok
                              marginProfit: double.parse(_controllerMarginProfit.text), //ok
                              salePrice: double.parse(_controllerSalePrice.text), //ok
                              descriptionPrice: _controllerDescriptionPrice.text, //ok
                              unitMeasure: _controllerUnitMeasure.text, //ok
                              barCode: '', //ok
                              barCodeInternal: '', //ok
                              dateExpiration: '', //ok
                              dateFabrication: '', //ok
                              gridType: _controllerGrid.text, //ok
                              heightMeasure: double.parse(_controllerHeightMeasure.text), //ok
                              widthMeasure: double.parse(_controllerWidthMeasure.text), //ok
                              internalCode: '', //ok
                              itemBatch: _controllerBatch.text, //ok
                              ncmCode: '', //ok
                              stock: double.parse(_controllerStock.text), //ok
                              stockAvailable: double.parse(_controllerStock.text), //ok
                              stockDamaged: 0,
                              stockMaximum: 0,
                              stockMinimum: 0,
                              stockReservation: 0,
                              supplier: _controllerSupplier.text,
                              //adicionar os campos abaixo no formulario
                              quantityItem: 0,
                              calculateMeasure: 0,
                              billingMeasure: 0,
                              totalItem: 0,
                            );
                            _novoAdicionarPreco(itemFlow);
                            if (_formCadItemKey.currentState!.validate()) {}
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Preços adicionados:'),
                    Container(
                      color: Colors.grey[200],
                      height: 200, // Defina uma altura adequada para a lista
                      child: ListView.builder(
                        itemCount: listPrices.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = listPrices[index];

                          return ListTile(
                            title: Text(item['descriptionPrice']),
                            subtitle: Text('Valor: ${item['salePrice']}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  listPrices.removeAt(index);
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
                        if (_formCadItemKey.currentState!.validate()) {
                          _adicionarItem();
                          Modular.to.navigate('/central-base/wms');
                        }
                      },
                      child: const Text('SALVAR NOVO ITEM'),
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
