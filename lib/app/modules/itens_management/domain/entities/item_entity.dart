class ItemEntity {
  final int? idItem;
  final int? idCorp;
  final int? idCompanyCorp;
  final String? descriptionItem;
  final String? unitMeasure;
  final String? nameSupplier;
  final String? nameBrand;
  final String? ncm;
  final String? status;
  final double? weight;
  final String? originItem;
  final String? taxClassification;
  final String? category;
  final String? createdAt;
  final String? updatedAt;
  final List<Map<String, dynamic>>? listPrices;

  const ItemEntity({
    this.idCorp,
    this.idCompanyCorp,
    this.listPrices,
    this.idItem,
    this.descriptionItem,
    this.unitMeasure,
    this.nameSupplier,
    this.nameBrand,
    this.ncm,
    this.status,
    this.weight,
    this.originItem,
    this.taxClassification,
    this.category,
    this.createdAt,
    this.updatedAt,
  });
}
