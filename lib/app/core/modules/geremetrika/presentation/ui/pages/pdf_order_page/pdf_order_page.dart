import 'package:flutter/material.dart';
import 'package:liberpass_baseweb/app/core/modules/geremetrika/domain/entities/order_entity.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfOrderPage extends StatefulWidget {
  final OrderEntity args;
  const PdfOrderPage({
    super.key,
    required this.args,
  });

  @override
  State<PdfOrderPage> createState() => _PdfOrderPageState();
}

class _PdfOrderPageState extends State<PdfOrderPage> {
  @override
  Widget build(BuildContext context) {
    final pdfArgs = ModalRoute.of(context)!.settings.arguments as OrderEntity;
    return Column(
      children: [
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => createPDF(
            pdfArgs.id,
            pdfArgs.name,
            pdfArgs.address,
            pdfArgs.phone,
            pdfArgs.createdAt,
            pdfArgs.updatedAt,
            pdfArgs.typePayment,
          ),
          child: const Text('Imprimir Pedido'),
        ),
      ],
    );
  }
}

Future<void> createPDF(
    id, name, address, phone, createdDate, updateDate, typePayment) async {
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
              name ?? 'Sem argumentos',
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
