class ItemPriceEntity {
  final String idPrice;
  final double valuePrice;
  final String descriptionPrice;
  final bool isActivePrice;

  const ItemPriceEntity({
    required this.idPrice,
    required this.valuePrice,
    required this.descriptionPrice,
    required this.isActivePrice,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'idPrice': idPrice});
    result.addAll({'valuePrice': valuePrice});
    result.addAll({'descriptionPrice': descriptionPrice});
    result.addAll({'isActivePrice': isActivePrice});

    return result;
  }

  factory ItemPriceEntity.fromMap(Map<String, dynamic> map) {
    return ItemPriceEntity(
      idPrice: map['idPrice'] ?? '',
      valuePrice: map['valuePrice']?.toDouble() ?? 0.0,
      descriptionPrice: map['descriptionPrice'] ?? '',
      isActivePrice: map['isActivePrice'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPrice': idPrice,
      'valuePrice': valuePrice,
      'descriptionPrice': descriptionPrice,
      'isActivePrice': isActivePrice,
    };
  }

  factory ItemPriceEntity.fromJson(Map<String, dynamic> json) {
    return ItemPriceEntity(
      idPrice: json['idPrice'] ?? '',
      valuePrice: json['valuePrice']?.toDouble() ?? 0.0,
      descriptionPrice: json['descriptionPrice'] ?? '',
      isActivePrice: json['isActivePrice'] ?? false,
    );
  }
}
