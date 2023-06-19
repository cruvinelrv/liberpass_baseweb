import 'dart:convert';

import 'package:flutter/foundation.dart';

class ItemEntity {
  final int? idItem;
  final String? internalCode;
  final int? idCorp;
  final int? idCompanyCorp;
  final String? descriptionItem;
  final String? unitMeasure;
  final String? nameBrand;
  final String? ncm;
  final String? status;
  final double? weight;
  final String? originItem;
  final String? taxClassification;
  final String? category;
  final String? createdAt;
  final String? updatedAt;
  final String? barCode;
  final List<Map<String, dynamic>>? listPrices;

  const ItemEntity({
    this.idItem,
    this.internalCode,
    this.idCorp,
    this.idCompanyCorp,
    this.descriptionItem,
    this.unitMeasure,
    this.nameBrand,
    this.ncm,
    this.status,
    this.weight,
    this.originItem,
    this.taxClassification,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.barCode,
    this.listPrices,
  });

  ItemEntity copyWith({
    int? idItem,
    String? internalCode,
    int? idCorp,
    int? idCompanyCorp,
    String? descriptionItem,
    String? unitMeasure,
    String? nameBrand,
    String? ncm,
    String? status,
    double? weight,
    String? originItem,
    String? taxClassification,
    String? category,
    String? createdAt,
    String? updatedAt,
    String? barCode,
    List<Map<String, dynamic>>? listPrices,
  }) {
    return ItemEntity(
      idItem: idItem ?? this.idItem,
      internalCode: internalCode ?? this.internalCode,
      idCorp: idCorp ?? this.idCorp,
      idCompanyCorp: idCompanyCorp ?? this.idCompanyCorp,
      descriptionItem: descriptionItem ?? this.descriptionItem,
      unitMeasure: unitMeasure ?? this.unitMeasure,
      nameBrand: nameBrand ?? this.nameBrand,
      ncm: ncm ?? this.ncm,
      status: status ?? this.status,
      weight: weight ?? this.weight,
      originItem: originItem ?? this.originItem,
      taxClassification: taxClassification ?? this.taxClassification,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      barCode: barCode ?? this.barCode,
      listPrices: listPrices ?? this.listPrices,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (idItem != null) {
      result.addAll({'idItem': idItem});
    }
    if (internalCode != null) {
      result.addAll({'internalCode': internalCode});
    }
    if (idCorp != null) {
      result.addAll({'idCorp': idCorp});
    }
    if (idCompanyCorp != null) {
      result.addAll({'idCompanyCorp': idCompanyCorp});
    }
    if (descriptionItem != null) {
      result.addAll({'descriptionItem': descriptionItem});
    }
    if (unitMeasure != null) {
      result.addAll({'unitMeasure': unitMeasure});
    }
    if (nameBrand != null) {
      result.addAll({'nameBrand': nameBrand});
    }
    if (ncm != null) {
      result.addAll({'ncm': ncm});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (weight != null) {
      result.addAll({'weight': weight});
    }
    if (originItem != null) {
      result.addAll({'originItem': originItem});
    }
    if (taxClassification != null) {
      result.addAll({'taxClassification': taxClassification});
    }
    if (category != null) {
      result.addAll({'category': category});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (barCode != null) {
      result.addAll({'barCode': barCode});
    }
    if (listPrices != null) {
      result.addAll({'listPrices': listPrices});
    }

    return result;
  }

  factory ItemEntity.fromMap(Map<String, dynamic> map) {
    return ItemEntity(
      idItem: map['idItem']?.toInt(),
      internalCode: map['internalCode'],
      idCorp: map['idCorp']?.toInt(),
      idCompanyCorp: map['idCompanyCorp']?.toInt(),
      descriptionItem: map['descriptionItem'],
      unitMeasure: map['unitMeasure'],
      nameBrand: map['nameBrand'],
      ncm: map['ncm'],
      status: map['status'],
      weight: map['weight']?.toDouble(),
      originItem: map['originItem'],
      taxClassification: map['taxClassification'],
      category: map['category'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      barCode: map['barCode'],
      listPrices: List.from(map['listPrices']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemEntity.fromJson(String source) => ItemEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemEntity(idItem: $idItem, internalCode: $internalCode, idCorp: $idCorp, idCompanyCorp: $idCompanyCorp, descriptionItem: $descriptionItem, unitMeasure: $unitMeasure, nameBrand: $nameBrand, ncm: $ncm, status: $status, weight: $weight, originItem: $originItem, taxClassification: $taxClassification, category: $category, createdAt: $createdAt, updatedAt: $updatedAt, barCode: $barCode, listPrices: $listPrices)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemEntity &&
        other.idItem == idItem &&
        other.internalCode == internalCode &&
        other.idCorp == idCorp &&
        other.idCompanyCorp == idCompanyCorp &&
        other.descriptionItem == descriptionItem &&
        other.unitMeasure == unitMeasure &&
        other.nameBrand == nameBrand &&
        other.ncm == ncm &&
        other.status == status &&
        other.weight == weight &&
        other.originItem == originItem &&
        other.taxClassification == taxClassification &&
        other.category == category &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.barCode == barCode &&
        listEquals(other.listPrices, listPrices);
  }

  @override
  int get hashCode {
    return idItem.hashCode ^
        internalCode.hashCode ^
        idCorp.hashCode ^
        idCompanyCorp.hashCode ^
        descriptionItem.hashCode ^
        unitMeasure.hashCode ^
        nameBrand.hashCode ^
        ncm.hashCode ^
        status.hashCode ^
        weight.hashCode ^
        originItem.hashCode ^
        taxClassification.hashCode ^
        category.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        barCode.hashCode ^
        listPrices.hashCode;
  }
}
