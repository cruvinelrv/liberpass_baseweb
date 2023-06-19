import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/cubits/item_cubit/item_cubit.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/cubits/item_cubit/states/states.dart';
import 'package:liberpass_baseweb/app/modules/shared/enums/enum_unit_measure.dart';

import '../../../../../central_base/sub_modules/wms/domain/entities/entities.dart';

class AddItemOrderPage extends StatefulWidget {
  const AddItemOrderPage({Key? key}) : super(key: key);

  @override
  State<AddItemOrderPage> createState() => _AddItemOrderPageState();
}

class _AddItemOrderPageState extends State<AddItemOrderPage> {
  late final ItemCubit _itemCubit;
  final GlobalKey<FormState> _formKeyAddItem = GlobalKey<FormState>();
  final TextEditingController _controllerItemDescription = TextEditingController();
  final TextEditingController _controllerItemPrice = TextEditingController();
  final TextEditingController _controllerItemQuantity = TextEditingController();
  final TextEditingController _controllerItemTotalValue = TextEditingController();
  final TextEditingController _controllerUnitMeasure = TextEditingController();
  final TextEditingController _controllerWidthMeasure = TextEditingController();
  final TextEditingController _controllerHeightMeasure = TextEditingController();
  double totalMetroQuadrado = 0;
  double metroQuadradoFaturamento = 0;
  late final FocusNode focus;
  late final FocusNode focusItemDescription;
  late final FocusNode focusItemPrice;
  late final FocusNode focusItemQuantity;
  late final FocusNode focusItemTotalValue;
  late final FocusNode focusUnitMeasure;
  late final FocusNode focusWidthMeasure;
  late final FocusNode focusHeightMeasure;
  late final FocusNode focusTypeItem;
  late final FocusNode focusSaveButton;

  @override
  void initState() {
    super.initState();
    _itemCubit = Modular.get<ItemCubit>();
    focus = FocusNode();
    focusTypeItem = FocusNode()..requestFocus();
    focusItemPrice = FocusNode();
    focusItemQuantity = FocusNode();
    focusItemTotalValue = FocusNode();
    focusUnitMeasure = FocusNode();
    focusWidthMeasure = FocusNode();
    focusHeightMeasure = FocusNode();
    focusItemDescription = FocusNode();
    focusSaveButton = FocusNode();
  }

  void clearFields() {
    _controllerItemDescription.clear();
    _controllerItemPrice.clear();
    _controllerItemQuantity.clear();
    _controllerItemTotalValue.clear();
    _controllerUnitMeasure.clear();
    _controllerWidthMeasure.clear();
    _controllerHeightMeasure.clear();
  }

  @override
  void dispose() {
    focus.dispose();
    focusItemDescription.dispose();
    focusItemPrice.dispose();
    focusItemQuantity.dispose();
    focusItemTotalValue.dispose();
    focusUnitMeasure.dispose();
    focusWidthMeasure.dispose();
    focusHeightMeasure.dispose();
    focusTypeItem.dispose();
    focusSaveButton.dispose();
    super.dispose();
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
      body: BlocBuilder<ItemCubit, ItemStates>(
        bloc: _itemCubit,
        builder: (context, state) {
          if (state is ItemCalculateState) {
            totalMetroQuadrado = _itemCubit.totalMetrosQuadrados;
            metroQuadradoFaturamento = _itemCubit.measureMeterBilling;
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKeyAddItem,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Row(
                          children: [
                            SizedBox(
                              width: 300,
                              child: DropdownButtonFormField<String>(
                                focusNode: focusTypeItem,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(10),
                                  labelText: 'Tipo de Item',
                                ),
                                items: [
                                  DropdownMenuItem<String>(
                                    value: EnumUnitMeasure.M2.nameUnitMeasure,
                                    child: const Text('Metro Quadrado'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: EnumUnitMeasure.M.nameUnitMeasure,
                                    child: const Text('Metro Linear'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: EnumUnitMeasure.UN.nameUnitMeasure,
                                    child: const Text('Unidade'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: EnumUnitMeasure.SRV.nameUnitMeasure,
                                    child: const Text('Serviço'),
                                  ),
                                ],
                                onChanged: (String? value) {
                                  if (value != null) {
                                    _controllerUnitMeasure.text = value;
                                  }
                                  focusWidthMeasure.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _controllerWidthMeasure,
                                focusNode: focusWidthMeasure,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  if (value == '0' &&
                                      _controllerUnitMeasure.text == EnumUnitMeasure.M2.nameUnitMeasure) {
                                    return 'Campo não pode ser 0';
                                  }

                                  return null;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Largura em milímetros',
                                ),
                                onEditingComplete: () {
                                  focusHeightMeasure.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _controllerHeightMeasure,
                                focusNode: focusHeightMeasure,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo obrigatório';
                                  }
                                  if (value == '0' &&
                                      _controllerUnitMeasure.text == EnumUnitMeasure.M2.nameUnitMeasure) {
                                    return 'Campo não pode ser 0';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Altura em milímetros',
                                ),
                                onEditingComplete: () {
                                  if (_controllerWidthMeasure.text.isNotEmpty) {
                                    _itemCubit.widthMeasure = double.parse(_controllerWidthMeasure.text);
                                  }
                                  if (_controllerHeightMeasure.text.isNotEmpty) {
                                    _itemCubit.heightMeasure = double.parse(_controllerHeightMeasure.text);
                                  }
                                  _itemCubit.calculateM2();
                                  focusItemDescription.requestFocus();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.green,
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          child: Wrap(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  if (_controllerWidthMeasure.text.isNotEmpty) {
                                    _itemCubit.widthMeasure = double.parse(_controllerWidthMeasure.text);
                                  }
                                  if (_controllerHeightMeasure.text.isNotEmpty) {
                                    _itemCubit.heightMeasure = double.parse(_controllerHeightMeasure.text);
                                  }
                                  _itemCubit.calculateM2();
                                },
                                icon: const Icon(Icons.refresh_outlined),
                                label: const Text('Calcular'),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'MEDIDA REAL: $totalMetroQuadrado m2',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'MEDIDA PARA FATURAMENTO: $metroQuadradoFaturamento m2',
                                style: const TextStyle(
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
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[A-Z 0-9]')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
                          onEditingComplete: () {
                            focusItemPrice.requestFocus();
                          },
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
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          onEditingComplete: () {
                            if (_controllerItemQuantity.text.isNotEmpty) {
                              _controllerItemTotalValue.text =
                                  (double.parse(_controllerItemPrice.text) * double.parse(_controllerItemQuantity.text))
                                      .toString();
                              _itemCubit.calculateTotalValue();
                            }
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
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          onEditingComplete: () {
                            if (_controllerItemQuantity.text.isNotEmpty) {
                              _controllerItemTotalValue.text =
                                  (double.parse(_controllerItemPrice.text) * double.parse(_controllerItemQuantity.text))
                                      .toString();
                              _itemCubit.calculateTotalValue();
                            }
                            focusItemTotalValue.requestFocus();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<ItemCubit, ItemStates>(
                          bloc: _itemCubit,
                          builder: (context, state) {
                            if (state is ItemTotalCalcState) {
                              _controllerItemTotalValue.text =
                                  (double.parse(_controllerItemPrice.text) * double.parse(_controllerItemQuantity.text))
                                      .toString();
                            }
                            return TextFormField(
                              controller: _controllerItemTotalValue,
                              focusNode: focusItemTotalValue,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              ],
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Valor Total do Item',
                              ),
                              onEditingComplete: () {
                                focusSaveButton.requestFocus();
                              },
                            );
                          },
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
                                focusNode: focusSaveButton,
                                onPressed: () async {
                                  if (_formKeyAddItem.currentState!.validate()) {
                                    _formKeyAddItem.currentState!.save();
                                    final double? heightVetro = double.tryParse(_controllerHeightMeasure.text);
                                    final double? widthVetro = double.tryParse(_controllerWidthMeasure.text);
                                    final itemFlow = ItemFlowEntity(
                                      costPrice: 0,
                                      descriptionPrice: _controllerItemDescription.text,
                                      idItemFlow: Random().nextInt(1000),
                                      isActivePrice: true,
                                      idCompanyCorp: 1,
                                      createdAt: Timestamp.now(),
                                      updatedAt: Timestamp.now(),
                                      idCorp: 1,
                                      purchasePrice: 0,
                                      salePrice: double.parse(_controllerItemPrice.text),
                                      unitMeasure: _controllerUnitMeasure.text,
                                      barCode: '',
                                      barCodeInternal: '',
                                      dateExpiration: '',
                                      dateFabrication: '',
                                      gridType: '',
                                      heightMeasure: heightVetro ?? 0,
                                      widthMeasure: widthVetro ?? 0,
                                      internalCode: '',
                                      itemBatch: '',
                                      marginCost: 0,
                                      margingProfit: 0,
                                      ncmCode: '',
                                      stock: double.parse(_controllerItemQuantity.text),
                                      stockAvailable: double.parse(_controllerItemQuantity.text),
                                      stockDamaged: 0,
                                      stockMaximum: 0,
                                      stockMinimum: 0,
                                      stockReservation: 0,
                                      supplier: '',
                                    );
                                    _itemCubit.addItem(item: itemFlow);
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
          );
        },
      ),
    );
  }
}
