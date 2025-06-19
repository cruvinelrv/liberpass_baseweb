// ignore_for_file: constant_identifier_names

enum EnumTypeAddressEnum {
  HOME(idTypeAddress: 1, nameTypeAddress: 'RESIDENCIAL'),
  WORK(idTypeAddress: 2, nameTypeAddress: 'COMERCIAL'),
  CHARGE(idTypeAddress: 3, nameTypeAddress: 'COBRANCA'),
  VIRTUAL(idTypeAddress: 4, nameTypeAddress: 'VIRTUAL');

  final int idTypeAddress;
  final String nameTypeAddress;
  const EnumTypeAddressEnum({
    required this.idTypeAddress,
    required this.nameTypeAddress,
  });
}
