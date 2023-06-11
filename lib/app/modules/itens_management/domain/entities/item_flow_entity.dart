class ItemFlowEntity {
  final int? idItemFlow;
  final String? internalCode;
  final int idCorp;
  final int idCompanyCorp;
  final String? itemBatch;
  final String? gridType;
  //final List<Map<String, dynamic>>? listSerialNumbers;
  //final List<Map<String, dynamic>>? listBaseIndicators;
  final double salePrice;
  final double costPrice;
  final double purchasePrice;
  final double? marginCost;
  final double? margingProfit;
  final String descriptionPrice;
  final String createdAt;
  final String? updatedAt;
  final String? dateFabrication;
  final String? dateExpiration;
  final double? stockReservation;
  final double? stockDamaged;
  final double? stockAvailable;
  final double? stock;
  final double? stockMinimum;
  final double? stockMaximum;
  final double? widthMeasure;
  final double? heightMeasure;
  final String? unitMeasure;
  final String? supplier;
  final String? barCode;
  final String? barCodeInternal;
  final String? ncmCode;
  final bool isActivePrice;

  const ItemFlowEntity({
    this.idItemFlow,
    this.internalCode,
    required this.idCorp,
    required this.idCompanyCorp,
    this.itemBatch,
    this.gridType,
    //this.listSerialNumbers,
    //this.listBaseIndicators,
    required this.salePrice,
    required this.costPrice,
    required this.purchasePrice,
    this.marginCost,
    this.margingProfit,
    required this.descriptionPrice,
    required this.createdAt,
    this.updatedAt,
    this.dateFabrication,
    this.dateExpiration,
    this.stockReservation,
    this.stockDamaged,
    this.stockAvailable,
    this.stock,
    this.stockMinimum,
    this.stockMaximum,
    this.supplier,
    required this.isActivePrice,
    this.widthMeasure,
    this.heightMeasure,
    this.unitMeasure,
    this.barCode,
    this.barCodeInternal,
    this.ncmCode,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result['idItemFlow'] = idItemFlow;
    result['idCorp'] = idCorp;
    result['idCompanyCorp'] = idCompanyCorp;
    result['itemBatch'] = itemBatch;
    result['gridType'] = gridType;
    result['salePrice'] = salePrice;
    result['costPrice'] = costPrice;
    result['purchasePrice'] = purchasePrice;
    result['marginCost'] = marginCost;
    result['margingProfit'] = margingProfit;
    result['descriptionPrice'] = descriptionPrice;
    result['createdAt'] = createdAt;
    result['updatedAt'] = updatedAt;
    result['dateFabrication'] = dateFabrication;
    result['dateExpiration'] = dateExpiration;
    result['isActivePrice'] = isActivePrice;

    return result;
  }

  factory ItemFlowEntity.fromMap(Map<String, dynamic> map) {
    return ItemFlowEntity(
      idItemFlow: map['idItemFlow'] as int?,
      idCorp: map['idCorp'] as int,
      idCompanyCorp: map['idCompanyCorp'] as int,
      itemBatch: map['itemBatch'] as String?,
      gridType: map['gridType'] as String?,
      salePrice: map['salePrice'] as double,
      costPrice: map['costPrice'] as double,
      purchasePrice: map['purchasePrice'] as double,
      marginCost: map['marginCost'] as double?,
      margingProfit: map['margingProfit'] as double?,
      descriptionPrice: map['descriptionPrice'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String?,
      dateFabrication: map['dateFabrication'] as String?,
      dateExpiration: map['dateExpiration'] as String?,
      isActivePrice: map['isActivePrice'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idItemFlow': idItemFlow,
      'idCorp': idCorp,
      'idCompanyCorp': idCompanyCorp,
      'itemBatch': itemBatch,
      'gridType': gridType,
      'salePrice': salePrice,
      'costPrice': costPrice,
      'purchasePrice': purchasePrice,
      'marginCost': marginCost,
      'margingProfit': margingProfit,
      'descriptionPrice': descriptionPrice,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'dateFabrication': dateFabrication,
      'dateExpiration': dateExpiration,
      'isActivePrice': isActivePrice,
    };
  }

  factory ItemFlowEntity.fromJson(Map<String, dynamic> json) {
    return ItemFlowEntity(
      idItemFlow: json['idItemFlow'] as int?,
      idCorp: json['idCorp'] as int,
      idCompanyCorp: json['idCompanyCorp'] as int,
      itemBatch: json['itemBatch'] as String?,
      gridType: json['gridType'] as String?,
      salePrice: json['salePrice'] as double,
      costPrice: json['costPrice'] as double,
      purchasePrice: json['purchasePrice'] as double,
      marginCost: json['marginCost'] as double?,
      margingProfit: json['margingProfit'] as double?,
      descriptionPrice: json['descriptionPrice'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      dateFabrication: json['dateFabrication'] as String?,
      dateExpiration: json['dateExpiration'] as String?,
      isActivePrice: json['isActivePrice'] as bool,
    );
  }
}
