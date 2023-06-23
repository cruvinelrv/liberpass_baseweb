import 'package:cloud_firestore/cloud_firestore.dart';

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
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
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
  final double? calculateMeasure;
  final double? billingMeasure;
  final String? unitMeasure;
  final String? supplier;
  final String? barCode;
  final String? barCodeInternal;
  final String? ncmCode;
  final bool isActivePrice;
  final double? totalItem;
  final double? quantityItem;

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
    this.calculateMeasure,
    this.billingMeasure,
    this.unitMeasure,
    this.barCode,
    this.barCodeInternal,
    this.ncmCode,
    this.totalItem,
    this.quantityItem,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result['idItemFlow'] = idItemFlow;
    result['internalCode'] = internalCode;
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
    result['stockReservation'] = stockReservation;
    result['stockDamaged'] = stockDamaged;
    result['stockAvailable'] = stockAvailable;
    result['stock'] = stock;
    result['stockMinimum'] = stockMinimum;
    result['stockMaximum'] = stockMaximum;
    result['widthMeasure'] = widthMeasure;
    result['heightMeasure'] = heightMeasure;
    result['calculateMeasure'] = calculateMeasure;
    result['billingMeasure'] = billingMeasure;
    result['unitMeasure'] = unitMeasure;
    result['supplier'] = supplier;
    result['barCode'] = barCode;
    result['barCodeInternal'] = barCodeInternal;
    result['ncmCode'] = ncmCode;
    result['isActivePrice'] = isActivePrice;
    result['totalItem'] = totalItem;
    result['quantityItem'] = quantityItem;

    return result;
  }

  factory ItemFlowEntity.fromMap(Map<String, dynamic> map) {
    return ItemFlowEntity(
      idItemFlow: map['idItemFlow'] as int?,
      internalCode: map['internalCode'] as String?,
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
      createdAt: map['createdAt'] as Timestamp?,
      updatedAt: map['updatedAt'] as Timestamp?,
      dateFabrication: map['dateFabrication'] as String?,
      dateExpiration: map['dateExpiration'] as String?,
      stockReservation: map['stockReservation'] as double?,
      stockDamaged: map['stockDamaged'] as double?,
      stockAvailable: map['stockAvailable'] as double?,
      stock: map['stock'] as double?,
      stockMinimum: map['stockMinimum'] as double?,
      stockMaximum: map['stockMaximum'] as double?,
      widthMeasure: map['widthMeasure'] as double?,
      heightMeasure: map['heightMeasure'] as double?,
      calculateMeasure: map['calculateMeasure'] as double?,
      billingMeasure: map['billingMeasure'] as double?,
      unitMeasure: map['unitMeasure'] as String?,
      supplier: map['supplier'] as String?,
      barCode: map['barCode'] as String?,
      barCodeInternal: map['barCodeInternal'] as String?,
      ncmCode: map['ncmCode'] as String?,
      isActivePrice: map['isActivePrice'] as bool,
      totalItem: map['totalItem'] as double?,
      quantityItem: map['quantityItem'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idItemFlow': idItemFlow,
      'internalCode': internalCode,
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
      'stockReservation': stockReservation,
      'stockDamaged': stockDamaged,
      'stockAvailable': stockAvailable,
      'stock': stock,
      'stockMinimum': stockMinimum,
      'stockMaximum': stockMaximum,
      'widthMeasure': widthMeasure,
      'heightMeasure': heightMeasure,
      'calculateMeasure': calculateMeasure,
      'billingMeasure': billingMeasure,
      'unitMeasure': unitMeasure,
      'supplier': supplier,
      'barCode': barCode,
      'barCodeInternal': barCodeInternal,
      'ncmCode': ncmCode,
      'isActivePrice': isActivePrice,
      'totalItem': totalItem,
      'quantityItem': quantityItem,
    };
  }

  factory ItemFlowEntity.fromJson(Map<String, dynamic> json) {
    return ItemFlowEntity(
      idItemFlow: json['idItemFlow'] as int?,
      internalCode: json['internalCode'] as String?,
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
      createdAt: json['createdAt'] as Timestamp?,
      updatedAt: json['updatedAt'] as Timestamp?,
      dateFabrication: json['dateFabrication'] as String?,
      dateExpiration: json['dateExpiration'] as String?,
      stockReservation: json['stockReservation'] as double?,
      stockDamaged: json['stockDamaged'] as double?,
      stockAvailable: json['stockAvailable'] as double?,
      stock: json['stock'] as double?,
      stockMinimum: json['stockMinimum'] as double?,
      stockMaximum: json['stockMaximum'] as double?,
      widthMeasure: json['widthMeasure'] as double?,
      heightMeasure: json['heightMeasure'] as double?,
      calculateMeasure: json['calculateMeasure'] as double?,
      billingMeasure: json['billingMeasure'] as double?,
      unitMeasure: json['unitMeasure'] as String?,
      supplier: json['supplier'] as String?,
      barCode: json['barCode'] as String?,
      barCodeInternal: json['barCodeInternal'] as String?,
      ncmCode: json['ncmCode'] as String?,
      isActivePrice: json['isActivePrice'] as bool,
      totalItem: json['totalItem'] as double?,
      quantityItem: json['quantityItem'] as double?,
    );
  }
}
