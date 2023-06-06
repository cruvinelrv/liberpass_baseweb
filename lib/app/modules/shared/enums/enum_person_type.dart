// ignore_for_file: constant_identifier_names

enum EnumPersonType {
  PF(idPersonType: 1, namePersonType: 'PESSOA FISICA'),
  PJ(idPersonType: 2, namePersonType: 'PESSOA JURIDICA');

  final int idPersonType;
  final String namePersonType;
  const EnumPersonType({
    required this.idPersonType,
    required this.namePersonType,
  });
}
