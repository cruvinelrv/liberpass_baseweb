import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../data/models/order_model.dart';

class CloseOrderPage extends StatefulWidget {
  final OrderModel opa;
  const CloseOrderPage({super.key, required this.opa});

  @override
  State<CloseOrderPage> createState() => _CloseOrderPageState();
}

class _CloseOrderPageState extends State<CloseOrderPage> {
  @override
  void initState() {
    super.initState();
    print(widget.opa);
  }

  @override
  Widget build(BuildContext context) {
    //final OrderModel args =
    //    ModalRoute.of(context)!.settings.arguments as OrderModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fechar Pedido'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Text(widget.opa.name),
          const SizedBox(height: 10),
          Text(widget.opa.address),
          const SizedBox(height: 10),
          Text(widget.opa.phone),
          const SizedBox(height: 10),
          Text(widget.opa.updatedAt.toString()),
          const SizedBox(height: 10),
          Text(widget.opa.createdAt.toString()),
          const SizedBox(height: 10),
          Text(widget.opa.typePayment),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => createPDF(widget.opa),
            child: const Text('Imprimir Pedido'),
          ),
        ],
      ),
    );
  }
}

Future<void> createPDF(args) async {
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
              args ?? 'Sem argumentos',
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
