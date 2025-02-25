import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final CollectionReference orderCollection = FirebaseFirestore.instance.collection('order_premier');

  List<ItemEntity> _selectedItems = [];
  ItemEntity? _selectedPriceListItem;

  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _paymentConditionController = TextEditingController();

  void _saveOrder() async {
    final order = OrderEntity(
      idOrder: Random().nextInt(1000).toString(),
      listItemEntity: _selectedItems,
      nameRecipient: _clientController.text,
      phone: _phoneController.text,
      address: _addressController.text,
      typePayment: _paymentConditionController.text,
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
      totalOrder: _calculateTotalOrder(),
    );

    try {
      await orderCollection.add(order.toJson());
      print('Order saved successfully!');
      showSaveConfirmationDialog();
    } catch (e) {
      print('Error saving order: $e');
      showSaveErrorDialog();
    }
  }

  double _calculateTotalOrder() {
    double total = 0;
    for (final item in _selectedItems) {
      total += item.price;
    }
    return total;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
      ),
      body: Column(
        children: [
          // Price list dropdown
          DropdownButton<ItemEntity>(
            value: _selectedPriceListItem,
            onChanged: (ItemEntity? newValue) {
              setState(() {
                _selectedPriceListItem = newValue;
              });
            },
            items: _selectedItems.map<DropdownMenuItem<ItemEntity>>(
              (ItemEntity item) {
                return DropdownMenuItem<ItemEntity>(
                  value: item,
                  child: Text(item.description),
                );
              },
            ).toList(),
          ),
          const SizedBox(height: 16.0),
          // Button to add selected item to the order
          ElevatedButton(
            onPressed: () {
              if (_selectedPriceListItem != null) {
                setState(() {
                  _selectedItems.add(_selectedPriceListItem!);
                });
              }
            },
            child: const Text('Add to Order'),
          ),
          const SizedBox(height: 16.0),
          // List of selected items in the order
          Expanded(
            child: ListView.builder(
              itemCount: _selectedItems.length,
              itemBuilder: (context, index) {
                final item = _selectedItems[index];
                return ListTile(
                  title: Text(item.description),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
          // Button to save the order
          ElevatedButton(
            onPressed: () {
              if (_selectedItems.isNotEmpty) {
                _saveOrder();
              }
            },
            child: const Text('Save Order'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _clientController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _paymentConditionController.dispose();
    super.dispose();
  }
}

class OrderEntity {
  final String idOrder;
  final List<ItemEntity> listItemEntity;
  final String nameRecipient;
  final String phone;
  final String address;
  final String typePayment;
  final String createdAt;
  final String updatedAt;
  final double totalOrder;

  OrderEntity({
    required this.idOrder,
    required this.listItemEntity,
    required this.nameRecipient,
    required this.phone,
    required this.address,
    required this.typePayment,
    required this.createdAt,
    required this.updatedAt,
    required this.totalOrder,
  });

  Map<String, dynamic> toJson() {
    return {
      'idOrder': idOrder,
      'listItemEntity': listItemEntity.map((item) => item.toJson()).toList(),
      'nameRecipient': nameRecipient,
      'phone': phone,
      'address': address,
      'typePayment': typePayment,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'totalOrder': totalOrder,
    };
  }
}

class ItemEntity {
  final String description;
  final double price;

  ItemEntity({
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'price': price,
    };
  }
}
