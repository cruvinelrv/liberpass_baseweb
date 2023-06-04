import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/list_item_entity.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/order_entity.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../cubits/item_cubit/item_cubit.dart';

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
  final TextEditingController _paymentConditionController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _itemCubit = Modular.get<ItemCubit>();
    _itensList = _itemCubit.actualListItens;
  }

  @override
  void dispose() {
    _clientController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _dateController.dispose();
    _paymentConditionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        TextFormField(
          controller: _clientController,
          decoration: const InputDecoration(
            labelText: 'Cliente',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _addressController,
          decoration: const InputDecoration(
            labelText: 'Endereço',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _phoneController,
          decoration: const InputDecoration(
            labelText: 'Fone',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _dateController,
          decoration: const InputDecoration(
            labelText: 'Data',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _paymentConditionController,
          decoration: const InputDecoration(
            labelText: 'Condição de pagamento',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            debugPrint('Imprimir Pedido em PDF');
            _itensList = _itemCubit.actualListItens;

            final OrderEntity orderEntity = OrderEntity(
              id: Random().nextInt(1000).toString(),
              listItemEntity: _itensList,
              name: _clientController.text,
              address: _addressController.text,
              phone: _phoneController.text,
              createdAt: _dateController.text,
              typePayment: _paymentConditionController.text,
              updatedAt: _dateController.text,
            );
            /*
            Navigator.pushNamed(
              context,
              '/pdf_order_page',
              arguments: OrderEntity(
                id: orderEntity.id,
                name: orderEntity.name,
                address: orderEntity.address,
                phone: orderEntity.phone,
                createdAt: orderEntity.createdAt,
                typePayment: orderEntity.typePayment,
                updatedAt: orderEntity.updatedAt,
              ),
            );
            */
            createPDFNewVersion(orderEntity);
          },
          child: const Text('Imprimir Pedido em PDF'),
        ),
        /*
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final OrderModel orderEntity = OrderModel(
              id: Random().nextInt(1000).toString(),
              listItemEntity: _itensList,
              name: _clientController.text,
              address: _addressController.text,
              phone: _phoneController.text,
              createdAt: _dateController.text,
              typePayment: _paymentConditionController.text,
              updatedAt: _dateController.text,
            );
            debugPrint(orderEntity.name);
            debugPrint(orderEntity.address);
            debugPrint(orderEntity.phone);
            debugPrint(orderEntity.createdAt);
            debugPrint(orderEntity.typePayment);
            debugPrint(orderEntity.updatedAt);
            debugPrint(orderEntity.id);
            debugPrint(orderEntity.typePayment);
            await Navigator.of(context).pushNamed(
              '/close_order_page',
              arguments: OrderModel(
                id: orderEntity.id,
                listItemEntity: orderEntity.listItemEntity,
                name: orderEntity.name,
                address: orderEntity.address,
                phone: orderEntity.phone,
                createdAt: orderEntity.createdAt,
                typePayment: orderEntity.typePayment,
                updatedAt: orderEntity.updatedAt,
              ),
            );

            //createPDF(orderEntity);
          },
          child: const Text('Preview'),
        ),
        */
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
              args.name,
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
                  item.description.toString(),
                  style: pw.TextStyle(font: font),
                ),
              for (var item in args.listItemEntity.listItems)
                pw.Text(
                  item.quantity.toString(),
                  style: pw.TextStyle(font: font),
                ),
              for (var item in args.listItemEntity.listItems)
                pw.Text(
                  item.price.toString(),
                  style: pw.TextStyle(font: font),
                ),
              for (var item in args.listItemEntity.listItems)
                pw.Text(
                  item.totalPriceValue.toString(),
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

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}

Future<void> createPDFNewVersion(OrderEntity args) async {
  final pdf = pw.Document();
  final font = await PdfGoogleFonts.nunitoExtraLight();

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
                args.name,
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
                'Total',
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
                  item.description.toString(),
                  style: pw.TextStyle(font: font),
                ),
                pw.Text(
                  item.quantity.toString(),
                  style: pw.TextStyle(font: font),
                ),
                pw.Text(
                  item.price.toString(),
                  style: pw.TextStyle(font: font),
                ),
                pw.Text(
                  item.totalPriceValue.toString(),
                  style: pw.TextStyle(font: font),
                ),
              ],
            ),
        ]),
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
                args.name,
                style: pw.TextStyle(font: font),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}

class WidgetBuildTableItens extends StatefulWidget {
  const WidgetBuildTableItens({super.key});

  @override
  State<WidgetBuildTableItens> createState() => _WidgetBuildTableItensState();
}

class _WidgetBuildTableItensState extends State<WidgetBuildTableItens> {
  late final ItemCubit _itemCubit;
  late final ListItemEntity _itensList;
  @override
  void initState() {
    super.initState();
    _itemCubit = Modular.get<ItemCubit>();
    _itensList = _itemCubit.listItensEntity;
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
              Text(item.description.toString()),
              Text(item.quantity.toString()),
              Text(item.price.toString()),
              Text(item.totalPriceValue.toString()),
            ],
          ),
      ],
    );
  }
}
