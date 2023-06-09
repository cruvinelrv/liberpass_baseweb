class ItemEntity {
  final int? idItem;
  final String? description;
  final double? widthMeasure;
  final double? heightMeasure;
  final double? salePrice;
  final double? purchasePrice;
  final double? costPrice;
  final String? unitMeasure;
  final double? quantity;
  final double? totalPriceValue;
  final List<Map<String, dynamic>>? listPrices;

  const ItemEntity({
    this.listPrices,
    this.salePrice,
    this.purchasePrice,
    this.costPrice,
    this.idItem,
    this.description,
    this.widthMeasure,
    this.heightMeasure,
    this.unitMeasure,
    this.quantity,
    this.totalPriceValue,
  });
}
