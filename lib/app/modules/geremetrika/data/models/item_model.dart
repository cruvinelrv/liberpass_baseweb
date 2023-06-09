import 'package:liberpass_baseweb/app/modules/itens_management/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    required int idItem,
    required String description,
    required double widthMeasure,
    required double heightMeasure,
    required double salePrice,
    required double purchasePrice,
    required double costPrice,
    required String unitMeasure,
    required double quantity,
    required double totalPriceValue,
    required List<Map<String, dynamic>> listPrices,
  }) : super(
          idItem: idItem,
          description: description,
          widthMeasure: widthMeasure,
          heightMeasure: heightMeasure,
          unitMeasure: unitMeasure,
          quantity: quantity,
          totalPriceValue: totalPriceValue,
          listPrices: listPrices,
        );

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      idItem: json['idItem'],
      description: json['description'],
      widthMeasure: json['widthMeasure'],
      heightMeasure: json['heightMeasure'],
      salePrice: json['salePrice'],
      purchasePrice: json['purchasePrice'],
      costPrice: json['costPrice'],
      unitMeasure: json['unitMeasure'],
      quantity: json['quantity'],
      totalPriceValue: json['totalPriceValue'],
      listPrices: json['listPrices'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idItem': idItem,
      'description': description,
      'widthMeasure': widthMeasure,
      'heightMeasure': heightMeasure,
      'salePrice': salePrice,
      'purchasePrice': purchasePrice,
      'costPrice': costPrice,
      'unitMeasure': unitMeasure,
      'quantity': quantity,
      'totalPriceValue': totalPriceValue,
      'listPrices': listPrices,
    };
  }
}
