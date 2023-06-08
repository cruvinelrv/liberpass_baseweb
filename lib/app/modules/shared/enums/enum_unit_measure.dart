// ignore_for_file: constant_identifier_names

enum EnumUnitMeasure {
  UN(idUnitMeasure: 1, nameUnitMeasure: 'UNIDADE'),
  KG(idUnitMeasure: 2, nameUnitMeasure: 'KILOGRAMA'),
  L(idUnitMeasure: 3, nameUnitMeasure: 'LITRO'),
  M(idUnitMeasure: 4, nameUnitMeasure: 'METRO LINEAR'),
  M2(idUnitMeasure: 5, nameUnitMeasure: 'METRO QUADRADO'),
  CM(idUnitMeasure: 6, nameUnitMeasure: 'CENTIMETRO'),
  MM(idUnitMeasure: 7, nameUnitMeasure: 'MILIMETRO'),
  GL(idUnitMeasure: 8, nameUnitMeasure: 'GALAO'),
  CX(idUnitMeasure: 11, nameUnitMeasure: 'CAIXA'),
  PC(idUnitMeasure: 12, nameUnitMeasure: 'PECA'),
  PCT(idUnitMeasure: 13, nameUnitMeasure: 'PACOTE'),
  SRV(idUnitMeasure: 14, nameUnitMeasure: 'SERVICO');

  final int idUnitMeasure;
  final String nameUnitMeasure;
  const EnumUnitMeasure({
    required this.idUnitMeasure,
    required this.nameUnitMeasure,
  });
}
