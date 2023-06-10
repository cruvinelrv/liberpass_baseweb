import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadItensPage extends StatefulWidget {
  const UploadItensPage({super.key});

  @override
  State<UploadItensPage> createState() => _UploadItensPageState();
}

class _UploadItensPageState extends State<UploadItensPage> {
  List<List<String>> _csvData = [];

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
    final lines = fileContent.split('\n');
    setState(() {
      _csvData = lines.map((line) => line.split(',')).toList();
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
            const SizedBox(height: 20),
            const Text('Dados do arquivo CSV:'),
            Expanded(
              child: ListView.builder(
                itemCount: _csvData.length,
                itemBuilder: (context, index) {
                  final row = _csvData[index];
                  return ListTile(
                    title: Text(row.join(', ')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
