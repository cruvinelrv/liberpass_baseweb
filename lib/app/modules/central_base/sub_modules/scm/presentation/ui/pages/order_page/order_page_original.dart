import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../domain/entities/entities.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final CollectionReference orderCollection = FirebaseFirestore.instance.collection('order_premier');
  TextEditingController _searchController = TextEditingController();
  bool _searching = false;
  List<Map<String, dynamic>> _searchResults = [];
  List<Map<String, dynamic>> _selectedItems = [];

  Future<void> _searchItems(String query) async {
    setState(() {
      _searching = true;
      _searchResults.clear();
    });

    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('itens_premier').where('descriptionItem', isEqualTo: query).get();

      setState(() {
        _searching = false;
        _searchResults = snapshot.docs.map((doc) => doc.data()).toList();
      });
    } catch (e) {
      print("Erro ao buscar itens: $e");
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String query = _searchController.text.trim();
                if (query.isNotEmpty) {
                  _searchItems(query).then((_) {
                    _showSearchResults(context);
                  });
                }
              },
              child: const Text('Search'),
            ),
            const SizedBox(height: 16.0),
            if (_searching)
              const CircularProgressIndicator()
            else if (_selectedItems.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _selectedItems.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> item = _selectedItems[index];
                    return ListTile(
                      title: Text(item['descriptionItem'] ?? ''),
                      subtitle: Text(item['internalCode'] ?? ''),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedItems.remove(item);
                          });
                        },
                        child: const Text('Excluir'),
                      ),
                    );
                  },
                ),
              )
            else
              const Text('No results found.'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectedItems.isEmpty ? null : () => _saveOrder(),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSearchResults(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search Results'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item = _searchResults[index];
                return ListTile(
                  title: Text(item['descriptionItem'] ?? ''),
                  subtitle: Text(item['internalCode'] ?? ''),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedItems.add(item);
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // esse metodo nao deu certo
  Future<void> _saveItemsToOrder() async {
    try {
      final batch = FirebaseFirestore.instance.batch();

      for (final item in _selectedItems) {
        final documentRef = FirebaseFirestore.instance.collection('order_premier').doc();
        batch.set(documentRef, item);
      }

      await batch.commit();

      setState(() {
        _selectedItems.clear();
      });
    } catch (e) {
      print("Erro ao salvar itens no pedido: $e");
    }
  }

  Future<void> _saveOrder() async {
    try {
      await orderCollection.add({'items': _selectedItems});
      print('Order saved successfully!');
      showSaveConfirmationDialog();
    } catch (e) {
      print('Error saving order: $e');
      showSaveErrorDialog();
    }
  }

  void showSaveConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Saved'),
          content: const Text('Your order has been saved successfully.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showSaveErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to save the order.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
