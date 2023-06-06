import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/data/models/item_model.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/cubits/item_cubit/item_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/shared/enums/enum_unit_measure.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  late final ItemCubit _itemCubit;
  final GlobalKey<FormState> _formKeyAddItem = GlobalKey<FormState>();
  final TextEditingController _controllerItemDescription =
      TextEditingController();
  final TextEditingController _controllerItemPrice = TextEditingController();
  final TextEditingController _controllerItemQuantity = TextEditingController();
  final TextEditingController _controllerItemTotalValue =
      TextEditingController();
  final TextEditingController _controllerUnitMeasure = TextEditingController();
  final TextEditingController _controllerWidthMeasure = TextEditingController();
  final TextEditingController _controllerHeightMeasure =
      TextEditingController();
  late final FocusNode focus;
  late final FocusNode focusItemDescription;
  late final FocusNode focusItemPrice;
  late final FocusNode focusItemQuantity;
  late final FocusNode focusItemTotalValue;
  late final FocusNode focusUnitMeasure;
  late final FocusNode focusWidthMeasure;
  late final FocusNode focusHeightMeasure;

  @override
  void initState() {
    super.initState();
    _itemCubit = Modular.get<ItemCubit>();
    focus = FocusNode();
    focusItemDescription = FocusNode()..requestFocus();
    focusItemPrice = FocusNode();
    focusItemQuantity = FocusNode();
    focusItemTotalValue = FocusNode();
    focusUnitMeasure = FocusNode();
    focusWidthMeasure = FocusNode();
    focusHeightMeasure = FocusNode();
  }
  /*
  @override
  void dispose() {
    super.dispose();
    focus.dispose();
    focusItemDescription.dispose();
    focusItemPrice.dispose();
    focusItemQuantity.dispose();
    focusItemTotalValue.dispose();
    focusUnitMeasure.dispose();
    _controllerItemDescription.dispose();
    _controllerItemPrice.dispose();
    _controllerItemQuantity.dispose();
    _controllerItemTotalValue.dispose();
    _controllerUnitMeasure.dispose();
  }
  */

  void clearFields() {
    _controllerItemDescription.clear();
    _controllerItemPrice.clear();
    _controllerItemQuantity.clear();
    _controllerItemTotalValue.clear();
    _controllerUnitMeasure.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Item'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKeyAddItem,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Unidade de Medida',
                      ),
                      items: [
                        DropdownMenuItem(
                          value: EnumUnitMeasure.M2.nameUnitMeasure,
                          child: const Text('Metro Quadrado'),
                        ),
                        DropdownMenuItem(
                          value: EnumUnitMeasure.M.nameUnitMeasure,
                          child: const Text('Metro Linear'),
                        ),
                      ],
                      onChanged: (value) {
                        _controllerUnitMeasure.text = value.toString();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllerWidthMeasure,
                      focusNode: focusWidthMeasure,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        if (value == '0') {
                          return 'Campo não pode ser 0';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Largura em milímetros',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllerHeightMeasure,
                      focusNode: focusHeightMeasure,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        if (value == '0') {
                          return 'Campo não pode ser 0';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Altura em milímetros',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.green,
                      height: 50,
                      child: Wrap(
                        children: [
                          Text(
                            'Medida em ${_controllerUnitMeasure.text.toString()}:',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            ' 0.00 m²',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllerItemDescription,
                      focusNode: focusItemDescription,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descrição do Item',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllerItemPrice,
                      focusNode: focusItemPrice,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Preço do Item',
                      ),
                      onEditingComplete: () {
                        focusItemQuantity.requestFocus();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllerItemQuantity,
                      focusNode: focusItemQuantity,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Quantidade de peças do Item',
                      ),
                      onEditingComplete: () {
                        _controllerItemTotalValue.text =
                            (double.parse(_controllerItemPrice.text) *
                                    double.parse(_controllerItemQuantity.text))
                                .toString();
                        focusItemTotalValue.requestFocus();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _controllerItemTotalValue,
                      focusNode: focusItemTotalValue,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Valor Total do Item',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              clearFields();
                            },
                            child: const Text('Limpar'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKeyAddItem.currentState!.validate()) {
                                _formKeyAddItem.currentState!.save();
                                final double? heightVetro = double.tryParse(
                                    _controllerHeightMeasure.text);
                                final double? widthVetro = double.tryParse(
                                    _controllerWidthMeasure.text);
                                final item = ItemModel(
                                  idItem: Random().nextInt(1000),
                                  description: _controllerItemDescription.text,
                                  heightMeasure: heightVetro ?? 0,
                                  widthMeasure: widthVetro ?? 0,
                                  price:
                                      double.parse(_controllerItemPrice.text),
                                  quantity: double.parse(
                                      _controllerItemQuantity.text),
                                  totalPriceValue: double.parse(
                                      _controllerItemTotalValue.text),
                                  unitMeasure: _controllerUnitMeasure.text,
                                );
                                _itemCubit.addItem(item: item);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Salvar'),
                          ),
                        ],
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

/*
            SliverFillRemaining(
              child: Row(
                children: [
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Unidade de Medida',
                    ),
                    items: [
                      DropdownMenuItem(
                        value: EnumUnitMeasure.M2.nameUnitMeasure,
                        child: const Text('Metro Quadrado'),
                      ),
                      DropdownMenuItem(
                        value: EnumUnitMeasure.M.nameUnitMeasure,
                        child: const Text('Metro Linear'),
                      ),
                    ],
                    onChanged: (value) {
                      _controllerUnitMeasure.text = value.toString();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _controllerWidthMeasure,
                    focusNode: focusWidthMeasure,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      if (value == '0') {
                        return 'Campo não pode ser 0';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Largura em milímetros',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _controllerHeightMeasure,
                    focusNode: focusHeightMeasure,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      if (value == '0') {
                        return 'Campo não pode ser 0';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Altura em milímetros',
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Container(
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _controllerItemDescription,
                            focusNode: focusItemDescription,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Descrição do Item',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _controllerItemPrice,
                            focusNode: focusItemPrice,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Preço do Item',
                            ),
                            onEditingComplete: () {
                              focusItemQuantity.requestFocus();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _controllerItemQuantity,
                            focusNode: focusItemQuantity,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Quantidade de peças do Item',
                            ),
                            onEditingComplete: () {
                              _controllerItemTotalValue.text =
                                  (double.parse(_controllerItemPrice.text) *
                                          double.parse(
                                              _controllerItemQuantity.text))
                                      .toString();
                              focusItemTotalValue.requestFocus();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _controllerItemTotalValue,
                            focusNode: focusItemTotalValue,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Valor Total do Item',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              clearFields();
                            },
                            child: const Text('Limpar'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKeyAddItem.currentState!.validate()) {
                                _formKeyAddItem.currentState!.save();
                                final double? heightVetro = double.tryParse(
                                    _controllerHeightMeasure.text);
                                final double? widthVetro = double.tryParse(
                                    _controllerWidthMeasure.text);
                                final item = ItemModel(
                                  idItem: Random().nextInt(1000),
                                  description: _controllerItemDescription.text,
                                  heightMeasure: heightVetro ?? 0,
                                  widthMeasure: widthVetro ?? 0,
                                  price:
                                      double.parse(_controllerItemPrice.text),
                                  quantity: double.parse(
                                      _controllerItemQuantity.text),
                                  totalPriceValue: double.parse(
                                      _controllerItemTotalValue.text),
                                  unitMeasure: _controllerUnitMeasure.text,
                                );
                                _itemCubit.addItem(item: item);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Salvar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                )*/
