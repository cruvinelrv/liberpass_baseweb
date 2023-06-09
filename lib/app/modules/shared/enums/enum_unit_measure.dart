// ignore_for_file: constant_identifier_names

enum EnumUnitMeasure {
  UN(idUnitMeasure: 1, nameUnitMeasure: 'UNIDADE', alias: 'UN'),
  KG(idUnitMeasure: 2, nameUnitMeasure: 'KILOGRAMA', alias: 'KG'),
  L(idUnitMeasure: 3, nameUnitMeasure: 'LITRO', alias: 'L'),
  M(idUnitMeasure: 4, nameUnitMeasure: 'METRO LINEAR', alias: 'M'),
  M2(idUnitMeasure: 5, nameUnitMeasure: 'METRO QUADRADO', alias: 'M2'),
  CM(idUnitMeasure: 6, nameUnitMeasure: 'CENTIMETRO', alias: 'CM'),
  MM(idUnitMeasure: 7, nameUnitMeasure: 'MILIMETRO', alias: 'MM'),
  GL(idUnitMeasure: 8, nameUnitMeasure: 'GALAO', alias: 'GL'),
  CX(idUnitMeasure: 11, nameUnitMeasure: 'CAIXA', alias: 'CX'),
  PC(idUnitMeasure: 12, nameUnitMeasure: 'PECA', alias: 'PC'),
  PCT(idUnitMeasure: 13, nameUnitMeasure: 'PACOTE', alias: 'PCT'),
  SRV(idUnitMeasure: 14, nameUnitMeasure: 'SERVICO', alias: 'SRV');

  final int idUnitMeasure;
  final String nameUnitMeasure;
  final String alias;
  const EnumUnitMeasure({
    required this.idUnitMeasure,
    required this.nameUnitMeasure,
    required this.alias,
  });
}
