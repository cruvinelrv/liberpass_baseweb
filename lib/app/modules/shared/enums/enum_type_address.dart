// ignore_for_file: constant_identifier_names

enum EnumTypeAddress {
  HOME(idTypeAddress: 1, nameTypeAddress: 'RESIDENCIAL'),
  WORK(idTypeAddress: 2, nameTypeAddress: 'COMERCIAL'),
  CHARGE(idTypeAddress: 3, nameTypeAddress: 'COBRANCA'),
  VIRTUAL(idTypeAddress: 4, nameTypeAddress: 'VIRTUAL');

  final int idTypeAddress;
  final String nameTypeAddress;
  const EnumTypeAddress({
    required this.idTypeAddress,
    required this.nameTypeAddress,
  });
}
