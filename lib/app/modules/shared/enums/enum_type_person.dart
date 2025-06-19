// ignore_for_file: constant_identifier_names

enum EnumTypePerson {
  PF(idTypePerson: 1, nameTypePerson: 'PESSOA FISICA'),
  PJ(idTypePerson: 2, nameTypePerson: 'PESSOA JURIDICA');

  final int idTypePerson;
  final String nameTypePerson;
  const EnumTypePerson({
    required this.idTypePerson,
    required this.nameTypePerson,
  });
}
