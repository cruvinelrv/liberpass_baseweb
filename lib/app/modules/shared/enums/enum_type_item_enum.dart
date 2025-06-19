// ignore_for_file: constant_identifier_names

enum EnumTypeItemEnum {
  PRODUCT(idTypeItem: 1, nameTypeItem: 'PRODUTO', abreviationItem: 'PROD'),
  SERVICE(idTypeItem: 2, nameTypeItem: 'SERVIÇO', abreviationItem: 'SERV'),
  PATRIMONY(idTypeItem: 3, nameTypeItem: 'PATRIMONIO', abreviationItem: 'PATR'),
  OTHER(idTypeItem: 4, nameTypeItem: 'OUTRO', abreviationItem: 'OUTR');

  final int idTypeItem;
  final String nameTypeItem;
  final String abreviationItem;
  const EnumTypeItemEnum({
    required this.idTypeItem,
    required this.nameTypeItem,
    required this.abreviationItem,
  });
}
