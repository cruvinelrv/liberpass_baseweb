import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/order_entity.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../data/models/order_model.dart';

class OrderHeadPage extends StatefulWidget {
  const OrderHeadPage({super.key});

  @override
  State<OrderHeadPage> createState() => _OrderHeadPageState();
}

class _OrderHeadPageState extends State<OrderHeadPage> {
  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _paymentConditionController =
      TextEditingController();

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
    //final headArgs = ModalRoute.of(context)!.settings.arguments as OrderEntity;
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
            final OrderEntity orderEntity = OrderEntity(
              id: Random().nextInt(1000).toString(),
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
            createPDF(orderEntity);
          },
          child: const Text('Imprimir Pedido em PDF'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final OrderModel orderEntity = OrderModel(
              id: Random().nextInt(1000).toString(),
              name: _clientController.text,
              address: _addressController.text,
              phone: _phoneController.text,
              createdAt: _dateController.text,
              typePayment: _paymentConditionController.text,
              updatedAt: _dateController.text,
            );
            print(orderEntity.name);
            print(orderEntity.address);
            print(orderEntity.phone);
            print(orderEntity.createdAt);
            print(orderEntity.typePayment);
            print(orderEntity.updatedAt);
            print(orderEntity.id);
            print(orderEntity.typePayment);
            await Navigator.of(context).pushNamed(
              '/close_order_page',
              arguments: OrderModel(
                id: orderEntity.id,
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
            pw.Text(
              'Hello World!',
              style: pw.TextStyle(font: font),
            ),
            pw.Text(
              args.name,
              style: pw.TextStyle(font: font),
            ),
          ],
        ),
      ),
    ),
  );

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
