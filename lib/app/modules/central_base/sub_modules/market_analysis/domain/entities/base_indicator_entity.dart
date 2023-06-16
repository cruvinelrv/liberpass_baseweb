class BaseIndicatorEntity {
  BaseIndicatorEntity({
    required this.idBaseIndicator,
    required this.nameIndicator,
    required this.descriptionIndicator,
    this.valueIndicator,
    this.percentualIndicator,
  });

  final int idBaseIndicator;
  final String nameIndicator;
  final String descriptionIndicator;
  final double? valueIndicator;
  final double? percentualIndicator;
}
