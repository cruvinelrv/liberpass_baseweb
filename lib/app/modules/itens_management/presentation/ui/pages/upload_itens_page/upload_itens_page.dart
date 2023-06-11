import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadItensPage extends StatefulWidget {
  const UploadItensPage({super.key});

  @override
  State<UploadItensPage> createState() => _UploadItensPageState();
}

class _UploadItensPageState extends State<UploadItensPage> {
  final firestore = FirebaseFirestore.instance;
  List<List<String>> _csvData = [];
  List<List<String>> currentPageDataList = [];
  int currentPage = 0;
  int rowsPerPage = 20;

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null && result.files.isNotEmpty) {
      final bytes = result.files.first.bytes;
      final fileContent = utf8.decode(bytes!);
      _loadCSVData(fileContent);
    }
  }

  void _loadCSVData(String fileContent) {
    final lines = LineSplitter.split(fileContent).toList();
    final csvData = lines.map((line) => line.split(',')).toList();

    if (csvData.isNotEmpty) {
      final headers = csvData.first;
      final columns = csvData.removeAt(0);
      final filteredData = csvData.where((row) {
        // Verificar se a linha não está vazia e tem o mesmo comprimento da primeira linha
        if (row.isNotEmpty && row.length == csvData.first.length) {
          // Obter o valor da coluna "ativo" e converter para maiúsculas
          final status = row[headers.indexOf('status')].toLowerCase();

          // Verificar se o item está ativo (considerando apenas letras maiúsculas)
          final isActive = status != 'inativo';
          return isActive;
        }
        return false;
      }).toList();
      debugPrint(filteredData.toString());
      if (filteredData.isEmpty) {
        filteredData.add(columns);
      } else {
        filteredData.insert(0, columns);
      }
      setState(() {
        _csvData = filteredData;
        currentPageDataList = _csvData.take(rowsPerPage).toList();
        currentPage = 0;
      });
    }
  }

  Future<void> insertDataToFirestore(String collectionName) async {
    final headers = _csvData[0];

    for (int i = 1; i < _csvData.length; i++) {
      final row = _csvData[i];
      final data = <String, dynamic>{};

      for (int j = 0; j < headers.length; j++) {
        final fieldName = headers[j];
        final fieldValue = row[j];
        data[fieldName] = fieldValue;
      }

      final documentId =
          'document_$i'; // Defina um ID único para cada documento
      final documentReference =
          FirebaseFirestore.instance.collection(collectionName).doc(documentId);
      await documentReference.set(data);
    }
  }

  Future<void> insertDataToFirestoreWithMap2(String collectionName) async {
    final headers = _csvData[0];
    final internalCodePriceIndex = headers.indexOf('internalCode');
    final salePriceIndex = headers.indexOf('salePrice');
    final purchasePriceIndex = headers.indexOf('costPrice');
    //final costPriceIndex = headers.indexOf('precoCusto');
    final stockIndex = headers.indexOf('quantity');
    final barCodeIndex = headers.indexOf('barCode');
    final ncm = headers.indexOf('ncm');
    final supplierIndex = headers.indexOf('nameSupplier');

    for (int i = 1; i < _csvData.length; i++) {
      final row = _csvData[i];
      final data = <String, dynamic>{};
      final idItemFlow = i;
      final internalCode = row[internalCodePriceIndex];
      final salePrice = row[salePriceIndex];
      final purchasePrice = row[purchasePriceIndex];
      final descriptionPrice = 'itemFlow[$i]';
      const isActivePrice = true;
      final stock = row[stockIndex];
      final supplier = row[supplierIndex];
      final barCode = row[barCodeIndex];
      final ncmCode = row[ncm];

      data['idItemFlow'] = idItemFlow;
      data['internalCode'] = internalCode;
      data['idCorp'] = 1;
      data['idCompanyCorp'] = 1;
      data['itemBatch'] = '';
      data['gridType'] = '';
      data['salePrice'] = salePrice;
      data['costPrice'] = 0;
      data['purchasePrice'] = purchasePrice;
      data['marginCost'] = 0;
      data['marginProfit'] = 0;
      data['descriptionPrice'] = descriptionPrice;
      data['createdAt'] = DateTime.now();
      data['updatedAt'] = DateTime.now();
      data['dateFabrication'] = '';
      data['dateExpiration'] = '';
      data['stockReservation'] = 0;
      data['stockAvailable'] = stock;
      data['stockDamaged'] = 0;
      data['stock'] = stock;
      data['supplier'] = supplier;
      data['stockMinimum'] = 0;
      data['stockMaximum'] = 0;
      data['isActivePrice'] = isActivePrice;
      data['barCode'] = barCode;
      data['ncmCode'] = ncmCode;

      final documentId = '$i'; // Defina um ID único para cada documento
      final documentReference =
          FirebaseFirestore.instance.collection(collectionName).doc(documentId);
      await documentReference.set(data);
    }
  }

  Future<void> insertDataToFirestoreWithMap(String collectionName) async {
    final headers = _csvData[0];

    for (int i = 1; i < _csvData.length; i++) {
      final row = _csvData[i];
      final data = <String, dynamic>{};

      // Preencher os campos do CSV no data excluindo campos específicos
      for (int j = 0; j < headers.length; j++) {
        final fieldName = headers[j];
        final fieldValue = row[j];

        // Excluir campos específicos dos documentos
        if (fieldName == 'quantity' ||
            fieldName == 'nameSupplier' ||
            fieldName == 'salePrice' ||
            fieldName == 'purchasePrice') {
          continue;
        }
        data[fieldName] = fieldValue;
      }

      // Criar a lista de listPrices
      final listPrices = [];
      final internalCodePriceIndex = headers.indexOf('internalCode');
      final salePriceIndex = headers.indexOf('salePrice');
      final purchasePriceIndex = headers.indexOf('purchasePrice');
      //final costPriceIndex = headers.indexOf('precoCusto');
      final stockIndex = headers.indexOf('quantity');
      final barCodeIndex = headers.indexOf('barCode');
      final ncm = headers.indexOf('ncm');
      final supplierIndex = headers.indexOf('nameSupplier');

      for (int k = 0; k < 2; k++) {
        final itemPrice = {
          'idItemFlow': i,
          'internalCode': row[internalCodePriceIndex],
          'idCorp': 1,
          'idCompanyCorp': 1,
          'itemBatch': '',
          'gridType': '',
          'salePrice': row[salePriceIndex],
          'costPrice': 0,
          'purchasePrice': row[purchasePriceIndex],
          'marginCost': 0,
          'marginProfit': 0,
          'descriptionPrice': 'Preço[$i]',
          'createdAt': DateTime.now(),
          'updatedAt': DateTime.now(),
          'dateFabrication': '',
          'dateExpiration': '',
          'stockReservation': 0,
          'stockAvailable': row[stockIndex],
          'stockDamaged': 0,
          'stock': row[stockIndex],
          'supplier': row[supplierIndex],
          'stockMinimum': 0,
          'stockMaximum': 0,
          'isActivePrice': true,
          'barCode': row[barCodeIndex],
          'ncmCode': row[ncm],
        };

        listPrices.add(itemPrice);
      }

      // Adicionar a lista de listPrices aos dados
      data['listPrices'] = listPrices;

      final documentId = '$i'; // Defina um ID único para cada documento
      final documentReference =
          FirebaseFirestore.instance.collection(collectionName).doc(documentId);
      await documentReference.set(data);
    }
  }

  Future<void> deleteCollection(String collectionPath) async {
    final collectionRef = FirebaseFirestore.instance.collection(collectionPath);

    final snapshot = await collectionRef.get();
    for (final document in snapshot.docs) {
      await document.reference.delete();
    }

    if (collectionRef.parent != null) {
      await collectionRef.parent!
          .collection(collectionRef.id)
          .get()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });
    }
  }

  Widget _buildTable2(List<List<String>> currentPageData) {
    if (currentPageData.isEmpty) {
      return const Text('Nenhum dado de CSV encontrado');
    }

    final List<String> headers = _csvData[0];
    final List<List<String>> rows = currentPageData.sublist(1);

    return DataTable(
      columns:
          headers.map((header) => DataColumn(label: Text(header))).toList(),
      rows: rows.map((row) {
        return DataRow(cells: row.map((cell) => DataCell(Text(cell))).toList());
      }).toList(),
    );
  }

  Widget _buildTable(List<List<String>> currentPageData) {
    if (currentPageData.isEmpty) {
      return const Text('Nenhum dado de CSV encontrado');
    }

    final List<String> headers = _csvData[0];
    final List<List<String>> rows = currentPageData.sublist(1);

    const visibleRowCount = 10; // Defina o número máximo de linhas visíveis

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width * 0.9,
        child: DataTable(
          columnSpacing: 25,
          headingRowColor: MaterialStateProperty.all(Colors.blue),
          headingTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          columns:
              headers.map((header) => DataColumn(label: Text(header))).toList(),
          rows: rows
              .take(visibleRowCount) // Limita o número de linhas visíveis
              .map((row) {
            return DataRow(
                cells: row.map((cell) => DataCell(Text(cell))).toList());
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPagination(int currentPage) {
    final totalPages = (_csvData.length / rowsPerPage).ceil();
    final actualPage = currentPage + 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed:
              currentPage > 0 ? () => _changePage(currentPage - 1) : null,
        ),
        Text('Página $actualPage de $totalPages'),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages - 1
              ? () => _changePage(currentPage + 1)
              : null,
        ),
      ],
    );
  }

  void _changePage(int page) {
    setState(() {
      final startIndex = page * rowsPerPage;
      final endIndex = (startIndex + rowsPerPage).clamp(0, _csvData.length);
      currentPageDataList = _csvData.sublist(startIndex, endIndex);
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSV Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectFile,
              child: const Text('Selecionar arquivo CSV'),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildTable(currentPageDataList),
              ),
            ),
            _buildPagination(currentPage),
            ElevatedButton(
              child: const Text('Enviar para o Firestore'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    TextEditingController controller = TextEditingController();
                    return AlertDialog(
                      title: const Text('Digite o nome da coleção'),
                      content: TextField(
                        controller: controller,
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancelar'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                          child: const Text('Enviar'),
                          onPressed: () {
                            String collectionName = controller.text;
                            //_uploadDataToFirestore(collectionName);
                            //saveDataToFirestore(collectionName);
                            insertDataToFirestore(collectionName);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ElevatedButton(
              child: const Text('Deletar do Firestore'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    TextEditingController controller = TextEditingController();
                    return AlertDialog(
                      title: const Text('Digite o nome da coleção'),
                      content: TextField(
                        controller: controller,
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancelar'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                          child: const Text('Enviar'),
                          onPressed: () {
                            String collectionName = controller.text;
                            // Obtendo o caminho de uma coleção
                            String collectionPath = collectionName;
                            debugPrint('collectionPath: $collectionPath');
// Obtendo o caminho de um documento dentro de uma coleção
                            //String documentPath =
                            //    'nome_da_colecao/nome_do_documento';

                            //_uploadDataToFirestore(collectionName);
                            //saveDataToFirestore(collectionName);
                            //insertDataToFirestore(collectionName);
                            //deleteCollection(collectionPath);
                            insertDataToFirestoreWithMap(collectionName);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
