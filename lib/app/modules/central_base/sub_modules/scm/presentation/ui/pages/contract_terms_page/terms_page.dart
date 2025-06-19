import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  final String contractPath = 'assets/contract.pdf'; // Caminho para o arquivo PDF

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contrato'),
      ),
      body: Container(
        child: PDFView(
          filePath: contractPath,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: false,
          pageSnap: true,
          defaultPage: 0,
          fitPolicy: FitPolicy.BOTH,
          onError: (error) {
            print('Erro ao carregar o PDF: $error');
          },
          onRender: (_pages) {
            print('PDF renderizado');
          },
          onPageError: (page, error) {
            print('Erro ao exibir a página $page: $error');
          },
          onViewCreated: (PDFViewController controller) {
            // Chamado quando o PDF é exibido
          },
          onPageChanged: (int? page, int? total) {
            print('page change: $page/$total');
            setState(() {
              var currentPage = page;
            });
          },
        ),
      ),
    );
  }
}
