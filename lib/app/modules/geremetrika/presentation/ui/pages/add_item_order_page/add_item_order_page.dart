import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/cubits/item_cubit/item_cubit.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/cubits/item_cubit/states/states.dart';
import 'package:liberpass_baseweb/app/modules/shared/enums/enum_unit_measure_enum.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../../central_base/sub_modules/scm/domain/entities/entities.dart';

class AddItemOrderPage extends StatefulWidget {
  const AddItemOrderPage({Key? key}) : super(key: key);

  @override
  State<AddItemOrderPage> createState() => _AddItemOrderPageState();
}

class _AddItemOrderPageState extends State<AddItemOrderPage> {
  late final ItemCubit _itemCubit;
  final GlobalKey<FormState> _formKeyAddItem = GlobalKey<FormState>();
  late final MaskTextInputFormatter formatter;
  final TextEditingController _controllerItemDescription = TextEditingController();
  final TextEditingController _controllerItemPrice = TextEditingController();
  final TextEditingController _controllerItemQuantity = TextEditingController();
  final TextEditingController _controllerItemTotalValue = TextEditingController();
  final TextEditingController _controllerUnitMeasure = TextEditingController();
  final TextEditingController _controllerWidthMeasure = TextEditingController();
  final TextEditingController _controllerHeightMeasure = TextEditingController();
  final TextEditingController _controllerBillingMeasure = TextEditingController();
  final TextEditingController _controllerCalculateMeasure = TextEditingController();
  double totalMetroQuadrado = 0;
  double metroQuadradoFaturamento = 0;
  double totalPerimetroMetroLinear = 0;
  double metroLinearFaturamento = 0;
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
    _controllerItemPrice.text = '0';
  }

  void clearFields() {
    _controllerItemDescription.clear();
    _controllerItemPrice.clear();
    _controllerItemQuantity.clear();
    _controllerItemTotalValue.clear();
    _controllerUnitMeasure.clear();
    _controllerWidthMeasure.clear();
    _controllerHeightMeasure.clear();
    _controllerBillingMeasure.clear();
    _controllerCalculateMeasure.clear();
    _itemCubit.backToInitialState();
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
    _controllerItemDescription.dispose();
    _controllerItemPrice.dispose();
    _controllerItemQuantity.dispose();
    _controllerItemTotalValue.dispose();
    _controllerUnitMeasure.dispose();
    _controllerWidthMeasure.dispose();
    _controllerHeightMeasure.dispose();
    _controllerBillingMeasure.dispose();
    _controllerCalculateMeasure.dispose();
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
            metroLinearFaturamento = _itemCubit.linearMeterPerimeterBilling;
            totalPerimetroMetroLinear = _itemCubit.realLinearMeterPerimeter;
            if (EnumUnitMeasureEnum.M.alias == _itemCubit.unitMeasure) {
              _controllerCalculateMeasure.text = totalPerimetroMetroLinear.toStringAsFixed(2);
              _controllerBillingMeasure.text = metroLinearFaturamento.toStringAsFixed(2);
            } else {
              _controllerCalculateMeasure.text = totalMetroQuadrado.toStringAsFixed(2);
              _controllerBillingMeasure.text = metroQuadradoFaturamento.toStringAsFixed(2);
            }
          }
          if (state is ItemTotalCalcState) {
            _controllerItemTotalValue.text = _itemCubit.totalPriceBrazilianCurrency;
            _itemCubit.backToInitialState();
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
                              width: 250,
                              child: DropdownButtonFormField<String>(
                                focusNode: focusTypeItem,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(10),
                                  labelText: 'Tipo de Item',
                                ),
                                items: [
                                  DropdownMenuItem<String>(
                                    value: EnumUnitMeasureEnum.M2.nameUnitMeasure,
                                    child: const Text('Metro Quadrado'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: EnumUnitMeasureEnum.M.nameUnitMeasure,
                                    child: const Text('Metro Linear'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: EnumUnitMeasureEnum.UN.nameUnitMeasure,
                                    child: const Text('Unidade'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: EnumUnitMeasureEnum.SRV.nameUnitMeasure,
                                    child: const Text('Serviço'),
                                  ),
                                ],
                                onChanged: (String? value) {
                                  if (value != null) {
                                    _controllerUnitMeasure.text = value;
                                  }
                                  if (EnumUnitMeasureEnum.M2.nameUnitMeasure == value ||
                                      EnumUnitMeasureEnum.M.nameUnitMeasure == value) {
                                    focusWidthMeasure.requestFocus();
                                  } else {
                                    focusItemDescription.requestFocus();
                                  }
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
                                  if (_controllerUnitMeasure.text == EnumUnitMeasureEnum.M2.nameUnitMeasure ||
                                      _controllerUnitMeasure.text == EnumUnitMeasureEnum.M.nameUnitMeasure) {
                                    if (value == null || value.isEmpty) {
                                      return 'Campo obrigatório';
                                    }
                                    if (value == '0') {
                                      return 'Campo não pode ser 0';
                                    }
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
                                  if (_controllerUnitMeasure.text == EnumUnitMeasureEnum.M2.nameUnitMeasure ||
                                      _controllerUnitMeasure.text == EnumUnitMeasureEnum.M.nameUnitMeasure) {
                                    if (value == null || value.isEmpty) {
                                      return 'Campo obrigatório';
                                    }
                                    if (value == '0') {
                                      return 'Campo não pode ser 0';
                                    }
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
                                  if (EnumUnitMeasureEnum.M2.nameUnitMeasure == _controllerUnitMeasure.text) {
                                    _itemCubit.calculateM2();
                                  } else if (EnumUnitMeasureEnum.M.nameUnitMeasure == _controllerUnitMeasure.text) {
                                    _itemCubit.calculatePerimeter();
                                  }
                                  focusItemDescription.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _controllerCalculateMeasure,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Medida Real',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 250,
                              child: TextFormField(
                                controller: _controllerBillingMeasure,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Medida para Faturamento',
                                ),
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
                              Visibility(
                                visible: false,
                                child: ElevatedButton.icon(
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
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        EnumUnitMeasureEnum.M2.nameUnitMeasure == _controllerUnitMeasure.text
                                            ? 'MEDIDA REAL: $totalMetroQuadrado M2'
                                            : 'MEDIDA REAL: $totalPerimetroMetroLinear Metros',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        EnumUnitMeasureEnum.M2.nameUnitMeasure == _controllerUnitMeasure.text
                                            ? 'MEDIDA PARA FATURAMENTO: $metroQuadradoFaturamento m2'
                                            : 'MEDIDA PARA FATURAMENTO: $metroLinearFaturamento m',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z 0-9]')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _controllerItemDescription.text = value.toUpperCase();
                            _controllerItemDescription.selection = TextSelection.fromPosition(
                              TextPosition(offset: _controllerItemDescription.text.length),
                            );
                          },
                          onEditingComplete: () {
                            focusItemPrice.requestFocus();
                          },
                          onTap: () {
                            if (_controllerWidthMeasure.text.isNotEmpty) {
                              _itemCubit.widthMeasure = double.parse(_controllerWidthMeasure.text);
                            }
                            if (_controllerHeightMeasure.text.isNotEmpty) {
                              _itemCubit.heightMeasure = double.parse(_controllerHeightMeasure.text);
                            }
                            if (EnumUnitMeasureEnum.M2.nameUnitMeasure == _controllerUnitMeasure.text) {
                              _itemCubit.calculateM2();
                            } else {
                              _itemCubit.calculatePerimeter();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _controllerItemPrice,
                                focusNode: focusItemPrice,
                                decoration: const InputDecoration(
                                  prefix: Text('R\$'),
                                  border: OutlineInputBorder(),
                                  labelText: 'Preço do Item ou valor do m2',
                                ),
                                inputFormatters: [
                                  TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                      String newText = newValue.text.replaceAll(RegExp(r'\D'), '');
                                      String value = newText;
                                      int cursorPosition = newText.length;
                                      if (newText.isNotEmpty) {
                                        value = _formatCurrency(double.parse(newText), 'pt_BR', 'R\$');
                                      }
                                      cursorPosition = value.length;

                                      return TextEditingValue(
                                          text: value, selection: TextSelection.collapsed(offset: cursorPosition));
                                    },
                                  ),
                                ],
                                onEditingComplete: () {
                                  focusItemQuantity.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 300,
                              child: TextFormField(
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
                                  String valuePrice = _controllerItemPrice.text;
                                  String valueQuantity = _controllerItemQuantity.text;
                                  String measureBilling = _controllerBillingMeasure.text;
                                  if (_controllerItemQuantity.text.isNotEmpty && _controllerItemPrice.text.isNotEmpty) {
                                    //_itemCubit.calculateTotalPriceAmericanDouble(
                                    //    price: valuePrice, quantity: valueQuantity);
                                  }
                                  if (EnumUnitMeasureEnum.M2.nameUnitMeasure == _controllerUnitMeasure.text ||
                                      EnumUnitMeasureEnum.M.nameUnitMeasure == _controllerUnitMeasure.text) {
                                    _itemCubit.calculatePriceAndMetersAmericanDouble(
                                        quantity: valueQuantity, price: valuePrice, measureBilling: measureBilling);
                                    _controllerItemTotalValue.text = _itemCubit.totalPriceAmericanDouble.toString();
                                  } else {
                                    _itemCubit.calculateTotalPriceAmericanDouble(
                                        quantity: valueQuantity, price: valuePrice);
                                    _controllerItemTotalValue.text = _itemCubit.totalPriceAmericanDouble.toString();
                                  }

                                  focusItemTotalValue.requestFocus();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 250,
                              child: TextFormField(
                                controller: _controllerItemTotalValue,
                                focusNode: focusItemTotalValue,
                                inputFormatters: [
                                  TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                      String newText = newValue.text.replaceAll(RegExp(r'\D'), '');
                                      String value = newText;
                                      int cursorPosition = newText.length;
                                      if (newText.isNotEmpty) {
                                        value = _formatCurrency(double.parse(newText), 'pt_BR', 'R\$');
                                      }
                                      cursorPosition = value.length;

                                      return TextEditingValue(
                                          text: value, selection: TextSelection.collapsed(offset: cursorPosition));
                                    },
                                  ),
                                ],
                                decoration: const InputDecoration(
                                  prefix: Text('R\$'),
                                  border: OutlineInputBorder(),
                                  labelText: 'Valor total do Item',
                                ),
                                onEditingComplete: () {
                                  focusSaveButton.requestFocus();
                                },
                                onTap: () {
                                  if (_controllerItemQuantity.text.isNotEmpty && _controllerItemPrice.text.isNotEmpty) {
                                    String valuePrice = _controllerItemPrice.text;
                                    String valueQuantity = _controllerItemQuantity.text;
                                    _itemCubit.calculateTotalPriceAmericanDouble(
                                        price: valuePrice, quantity: valueQuantity);
                                  }
                                  if (EnumUnitMeasureEnum.M2.nameUnitMeasure == _controllerUnitMeasure.text ||
                                      EnumUnitMeasureEnum.M.nameUnitMeasure == _controllerUnitMeasure.text) {
                                    _controllerItemTotalValue.text = _itemCubit.totalPriceAmericanDouble.toString();
                                  } else {
                                    _controllerItemTotalValue.text = _itemCubit.totalPriceAmericanDouble.toString();
                                  }
                                },
                              ),
                            ),
                          ],
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
                                focusNode: focusSaveButton,
                                onPressed: () async {
                                  debugPrint(_itemCubit.totalPriceAmericanDouble.toString());
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
                                      salePrice: _itemCubit.priceAmericanDouble,
                                      unitMeasure: _controllerUnitMeasure.text,
                                      barCode: '',
                                      barCodeInternal: '',
                                      dateExpiration: '',
                                      dateFabrication: '',
                                      gridType: '',
                                      heightMeasure: heightVetro ?? 0,
                                      widthMeasure: widthVetro ?? 0,
                                      calculateMeasure: double.tryParse(_controllerCalculateMeasure.text) ?? 0,
                                      billingMeasure: double.tryParse(_controllerBillingMeasure.text) ?? 0,
                                      internalCode: '',
                                      itemBatch: '',
                                      marginCost: 0,
                                      marginProfit: 0,
                                      ncmCode: '',
                                      stock: double.parse(_controllerItemQuantity.text),
                                      stockAvailable: double.parse(_controllerItemQuantity.text),
                                      stockDamaged: 0,
                                      stockMaximum: 0,
                                      stockMinimum: 0,
                                      stockReservation: 0,
                                      supplier: '',
                                      totalItem: _itemCubit.totalPriceAmericanDouble,
                                    );
                                    _itemCubit.addItem(item: itemFlow);
                                    _itemCubit.calculateTotalOrder(_itemCubit.actualListItens);
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

String _formatCurrency(num value, String locale, String symbol) {
  ArgumentError.checkNotNull(value, 'value');
  value = value / 100;
  return NumberFormat.currency(
    customPattern: '###,###,###,###,###,###.##',
    locale: locale,
    symbol: symbol,
  ).format(value);
}
