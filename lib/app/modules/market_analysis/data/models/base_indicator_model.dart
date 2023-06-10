import '../../domain/entities/base_indicator_entity.dart';

class BaseIndicatorModel implements BaseIndicatorEntity {
  const BaseIndicatorModel({
    required this.idBaseIndicator,
    required this.nameIndicator,
    required this.descriptionIndicator,
    this.valueIndicator,
    this.percentualIndicator,
  });

  @override
  final int idBaseIndicator;
  @override
  final String nameIndicator;
  @override
  final String descriptionIndicator;
  @override
  final double? valueIndicator;
  @override
  final double? percentualIndicator;

  factory BaseIndicatorModel.fromJson(Map<String, dynamic> json) {
    return BaseIndicatorModel(
      idBaseIndicator: json['idBaseIndicator'],
      nameIndicator: json['nameIndicator'],
      descriptionIndicator: json['descriptionIndicator'],
      valueIndicator: json['valueIndicator'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idBaseIndicator': idBaseIndicator,
      'nameIndicator': nameIndicator,
      'descriptionIndicator': descriptionIndicator,
      'valueIndicator': valueIndicator,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseIndicatorModel &&
        other.idBaseIndicator == idBaseIndicator &&
        other.nameIndicator == nameIndicator &&
        other.descriptionIndicator == descriptionIndicator &&
        other.valueIndicator == valueIndicator;
  }

  @override
  int get hashCode {
    return idBaseIndicator.hashCode ^
        nameIndicator.hashCode ^
        descriptionIndicator.hashCode ^
        valueIndicator.hashCode;
  }

  @override
  String toString() {
    return 'BaseIndicatorModel(idBaseIndicator: $idBaseIndicator, nameIndicator: $nameIndicator, descriptionIndicator: $descriptionIndicator, valueIndicator: $valueIndicator)';
  }
}
