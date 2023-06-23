import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/list_item_entity.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/order_entity.dart';
import 'package:liberpass_baseweb/app/modules/shared/extensions/extensions.dart';
import 'package:liberpass_baseweb/app/modules/shared/masks/input_masks.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../cubits/item_cubit/item_cubit.dart';
import '../../cubits/item_cubit/states/states.dart';
import '../add_item_order_page/add_item_order_page.dart';

class OrderHeadPage extends StatefulWidget {
  const OrderHeadPage({super.key});

  @override
  State<OrderHeadPage> createState() => _OrderHeadPageState();
}

class _OrderHeadPageState extends State<OrderHeadPage> {
  late final ItemCubit _itemCubit;
  late ListItemEntity _itensList;
  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _paymentConditionController = TextEditingController();
  late final FocusNode focus;
  late final FocusNode focusClient;
  late final FocusNode focusPhone;
  late final FocusNode focusAddress;
  late final FocusNode focusDate;
  late final FocusNode focusPaymentCondition;
  late final FocusNode focusAddItemButton;
  double totalOrder = 0;

  @override
  void initState() {
    super.initState();
    _itemCubit = Modular.get<ItemCubit>();
    _itensList = _itemCubit.actualListItens;
    focus = FocusNode();
    focusClient = FocusNode()..requestFocus();
    focusPhone = FocusNode();
    focusAddress = FocusNode();
    focusDate = FocusNode();
    focusPaymentCondition = FocusNode();
    focusAddItemButton = FocusNode();
    _dateController.text = DateTime.now().toString().substring(0, 10).applyDateMaskBrazilian();
  }

  @override
  void dispose() {
    _clientController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _dateController.dispose();
    _paymentConditionController.dispose();
    focus.dispose();
    focusClient.dispose();
    focusPhone.dispose();
    focusAddress.dispose();
    focusDate.dispose();
    focusPaymentCondition.dispose();
    focusAddItemButton.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        TextFormField(
          focusNode: focusClient,
          controller: _clientController,
          decoration: const InputDecoration(
            labelText: 'Cliente',
            border: OutlineInputBorder(),
          ),
          onEditingComplete: () {
            focusAddress.requestFocus();
          },
          onChanged: (value) {
            _clientController.text = value.toUpperCase();
            _clientController.selection =
                TextSelection.fromPosition(TextPosition(offset: _clientController.text.length));
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          focusNode: focusAddress,
          controller: _addressController,
          decoration: const InputDecoration(
            labelText: 'Endereço',
            border: OutlineInputBorder(),
          ),
          onEditingComplete: () {
            focusPhone.requestFocus();
          },
          onChanged: (value) {
            _addressController.text = value.toUpperCase();
            _addressController.selection =
                TextSelection.fromPosition(TextPosition(offset: _addressController.text.length));
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SizedBox(
              width: 250,
              child: TextFormField(
                focusNode: focusPhone,
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Fone',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  InputMasks.phoneMask(),
                  /*
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    if (newValue.text.length > 11) {
                      return oldValue;
                    }
                    return newValue;
                  }),
                  */
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onEditingComplete: () {
                  focusDate.requestFocus();
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                focusNode: focusDate,
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Data',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  InputMasks.dateMask(),
                ],
                onEditingComplete: () {
                  focusPaymentCondition.requestFocus();
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                focusNode: focusPaymentCondition,
                controller: _paymentConditionController,
                decoration: const InputDecoration(
                  labelText: 'Condição de pagamento',
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () {
                  focusAddItemButton.requestFocus();
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 5,
                fixedSize: const Size(200, 56),
              ),
              focusNode: focusAddItemButton,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddItemOrderPage(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Adicionar Item'),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
                elevation: 5,
                fixedSize: const Size(200, 56),
              ),
              onPressed: () {
                debugPrint('Imprimir Pedido em PDF');
                _itensList = _itemCubit.actualListItens;

                final order = OrderEntity(
                  idOrder: Random().nextInt(1000).toString(),
                  listItemEntity: _itensList,
                  nameRecipient: _clientController.text,
                  phone: _phoneController.text,
                  address: _addressController.text,
                  typePayment: _paymentConditionController.text,
                  createdAt: DateTime.now().toString(),
                  updatedAt: DateTime.now().toString(),
                  totalOrder: _itemCubit.totalPriceOrder,
                );
                createPDFNewVersion(order);
              },
              icon: const Icon(Icons.print),
              label: const Text('Imprimir Pedido'),
            ),
            const SizedBox(width: 10),
            BlocBuilder<ItemCubit, ItemStates>(
              bloc: _itemCubit,
              builder: (context, state) {
                if (state is ItemSuccessState) {
                  totalOrder = _itemCubit.totalPriceOrder;
                }
                return Text.rich(
                  TextSpan(
                    text: 'Total: ',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'R\$ ${totalOrder.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

Future<void> createPDF(OrderEntity args) async {
  final pdf = pw.Document();
  final font = await PdfGoogleFonts.nunitoExtraLight();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Column(
          children: [
            pw.Row(
              children: [
                pw.Text(
                  'PREMIER SERVIÇOS DE BISOTÊ',
                  style: pw.TextStyle(font: font, fontSize: 14),
                ),
                pw.SizedBox(width: 10),
                pw.Text(
                  'FONE: (51) 99999-9999',
                  style: pw.TextStyle(font: font, fontSize: 14),
                ),
              ],
            ),
            pw.Text(
              args.nameRecipient,
              style: pw.TextStyle(font: font),
            ),
            pw.Text(
              args.address,
              style: pw.TextStyle(font: font),
            ),
            pw.Text(
              args.phone,
              style: pw.TextStyle(font: font),
            ),
            pw.Text(
              args.createdAt,
              style: pw.TextStyle(font: font),
            ),
            pw.Text(
              args.typePayment,
              style: pw.TextStyle(font: font),
            ),
            pw.Text(
              args.updatedAt,
              style: pw.TextStyle(font: font),
            ),
            pw.Row(children: [
              for (var item in args.listItemEntity.listItems)
                pw.Text(
                  item.unitMeasure.toString(),
                  style: pw.TextStyle(font: font),
                ),
              for (var item in args.listItemEntity.listItems)
                pw.Text(
                  item.descriptionPrice.toString(),
                  style: pw.TextStyle(font: font),
                ),
              for (var item in args.listItemEntity.listItems)
                pw.Text(
                  item.stock.toString(),
                  style: pw.TextStyle(font: font),
                ),
              for (var item in args.listItemEntity.listItems)
                pw.Text(
                  item.salePrice.toString(),
                  style: pw.TextStyle(font: font),
                ),
              for (var item in args.listItemEntity.listItems)
                pw.Text(
                  item.totalItem.toString(),
                  style: pw.TextStyle(font: font),
                ),
            ]),
            pw.BarcodeWidget(
              barcode: pw.Barcode.qrCode(),
              data: 'https://www.uol.com.br',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    ),
  );

  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
}

Future<void> createPDFNewVersion(OrderEntity args) async {
  final pdf = pw.Document();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final _itemCubit = Modular.get<ItemCubit>();
  final double subTotal = _itemCubit.totalPriceOrder;

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                'PREMIER SERVIÇOS DE BISOTÊ',
                style: pw.TextStyle(font: font, fontSize: 14),
              ),
              pw.Text(
                'FONE: (51) 99999-9999',
                style: pw.TextStyle(font: font, fontSize: 14),
              ),
            ],
          ),
        ),
        pw.Header(
          level: 1,
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                args.nameRecipient,
                style: pw.TextStyle(font: font),
              ),
              pw.Text(
                args.createdAt,
                style: pw.TextStyle(font: font),
              ),
            ],
          ),
        ),
        pw.Header(
          level: 2,
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                args.address,
                style: pw.TextStyle(font: font),
              ),
              pw.Text(
                args.phone,
                style: pw.TextStyle(font: font),
              ),
            ],
          ),
        ),
        pw.Header(
          level: 3,
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                args.typePayment,
                style: pw.TextStyle(font: font),
              ),
              pw.Text(
                args.updatedAt,
                style: pw.TextStyle(font: font),
              ),
            ],
          ),
        ),
        pw.Table(children: [
          pw.TableRow(
            children: [
              pw.Text(
                'Un',
                style: pw.TextStyle(font: font),
              ),
              pw.Text(
                'Descrição',
                style: pw.TextStyle(font: font),
              ),
              pw.Text(
                'Qtd',
                style: pw.TextStyle(font: font),
              ),
              pw.Text(
                'Valor',
                style: pw.TextStyle(font: font),
              ),
              pw.Text(
                'Total Item',
                style: pw.TextStyle(font: font),
              ),
            ],
          ),
          for (var item in args.listItemEntity.listItems)
            pw.TableRow(
              children: [
                pw.Text(
                  item.unitMeasure.toString(),
                  style: pw.TextStyle(font: font),
                ),
                pw.Text(
                  item.descriptionPrice.toString(),
                  style: pw.TextStyle(font: font),
                ),
                pw.Text(
                  item.stock.toString(),
                  style: pw.TextStyle(font: font),
                ),
                pw.Text(
                  item.salePrice.toString(),
                  style: pw.TextStyle(font: font),
                ),
                pw.Text(
                  item.totalItem.toString(),
                  style: pw.TextStyle(font: font),
                ),
              ],
            ),
        ]),
        pw.Footer(
          title: pw.Row(children: [
            pw.Text(
              'SUBTOTAL: ${subTotal.toStringAsFixed(2)}',
              style: pw.TextStyle(font: font),
            ),
          ]),
        ),
        pw.Footer(
          title: pw.Row(children: [
            pw.Text(
              'FORMA DE PAGAMENTO: ${args.typePayment}',
              style: pw.TextStyle(font: font),
            ),
          ]),
        ),
        pw.Spacer(),
        pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                '______________________________',
                style: pw.TextStyle(font: font),
              ),
              pw.Text(
                args.nameRecipient,
                style: pw.TextStyle(font: font),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
}

class WidgetBuildTableItens extends StatefulWidget {
  const WidgetBuildTableItens({super.key});

  @override
  State<WidgetBuildTableItens> createState() => _WidgetBuildTableItensState();
}

class _WidgetBuildTableItensState extends State<WidgetBuildTableItens> {
  late final ItemCubit itemCubit;
  late final ListItemEntity _itensList;
  @override
  void initState() {
    super.initState();
    itemCubit = Modular.get<ItemCubit>();
    _itensList = itemCubit.listItensEntity;
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(64),
        3: FixedColumnWidth(64),
        4: FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        const TableRow(
          children: <Widget>[
            Text('Un'),
            Text('Descrição'),
            Text('Qtd'),
            Text('Preço'),
            Text('Total'),
          ],
        ),
        for (var item in _itensList.listItems)
          TableRow(
            children: <Widget>[
              Text(item.unitMeasure.toString()),
              Text(item.descriptionPrice.toString()),
              Text(item.stock.toString()),
              Text(item.salePrice.toString()),
              Text(item.totalItem.toString()),
            ],
          ),
      ],
    );
  }
}
