// ignore_for_file: constant_identifier_names

enum EnumPersonBusinessRelationEnum {
  CLIENT(idPersonBusinessRelation: 1, namePersonBusinessRelation: 'CLIENTE'),
  SUPPLIER_SERVICES(idPersonBusinessRelation: 2, namePersonBusinessRelation: 'FORNECEDOR DE SERVICOS'),
  SUPPLIER_PRODUCTS(idPersonBusinessRelation: 3, namePersonBusinessRelation: 'FORNECEDOR DE PRODUTOS'),
  EMPLOYEE(idPersonBusinessRelation: 4, namePersonBusinessRelation: 'FUNCIONARIO'),
  PARTNER(idPersonBusinessRelation: 5, namePersonBusinessRelation: 'SOCIO'),
  INVESTOR(idPersonBusinessRelation: 6, namePersonBusinessRelation: 'INVESTIDOR'),
  TRANSPORTER(idPersonBusinessRelation: 7, namePersonBusinessRelation: 'TRANSPORTADORA'),
  BENEFICIARY(idPersonBusinessRelation: 8, namePersonBusinessRelation: 'BENEFICIARIO'),
  DEPENDENT(idPersonBusinessRelation: 9, namePersonBusinessRelation: 'DEPENDENTE'),
  USER(idPersonBusinessRelation: 10, namePersonBusinessRelation: 'USUARIO'),
  OTHER(idPersonBusinessRelation: 11, namePersonBusinessRelation: 'OUTROS');

  final int idPersonBusinessRelation;
  final String namePersonBusinessRelation;
  const EnumPersonBusinessRelationEnum({
    required this.idPersonBusinessRelation,
    required this.namePersonBusinessRelation,
  });
}
