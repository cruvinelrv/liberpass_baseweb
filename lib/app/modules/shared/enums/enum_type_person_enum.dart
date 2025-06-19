// ignore_for_file: constant_identifier_names

enum EnumTypePersonEnum {
  PF(idTypePerson: 1, nameTypePerson: 'PESSOA FISICA'),
  PJ(idTypePerson: 2, nameTypePerson: 'PESSOA JURIDICA');

  final int idTypePerson;
  final String nameTypePerson;
  const EnumTypePersonEnum({
    required this.idTypePerson,
    required this.nameTypePerson,
  });
}
