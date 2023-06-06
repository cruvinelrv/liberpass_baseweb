import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    required int idItem,
    required String description,
    required double widthMeasure,
    required double heightMeasure,
    required double price,
    required String unitMeasure,
    required double quantity,
    required double totalPriceValue,
  }) : super(
          idItem: idItem,
          description: description,
          price: price,
          widthMeasure: widthMeasure,
          heightMeasure: heightMeasure,
          unitMeasure: unitMeasure,
          quantity: quantity,
          totalPriceValue: totalPriceValue,
        );

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      idItem: json['idItem'],
      description: json['description'],
      widthMeasure: json['widthMeasure'],
      heightMeasure: json['heightMeasure'],
      price: json['price'],
      unitMeasure: json['unitMeasure'],
      quantity: json['quantity'],
      totalPriceValue: json['totalPriceValue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idItem': idItem,
      'description': description,
      'widthMeasure': widthMeasure,
      'heightMeasure': heightMeasure,
      'price': price,
      'unitMeasure': unitMeasure,
      'quantity': quantity,
      'totalPriceValue': totalPriceValue,
    };
  }
}
