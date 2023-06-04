import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    required String description,
    required double price,
    required String unitMeasure,
    required double quantity,
    required double totalPriceValue,
  }) : super(
          description: description,
          price: price,
          unitMeasure: unitMeasure,
          quantity: quantity,
          totalPriceValue: totalPriceValue,
        );

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      description: json['description'],
      price: json['price'],
      unitMeasure: json['unitMeasure'],
      quantity: json['quantity'],
      totalPriceValue: json['totalPriceValue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'price': price,
      'unitMeasure': unitMeasure,
      'quantity': quantity,
      'totalPriceValue': totalPriceValue,
    };
  }
}
