// ignore_for_file: constant_identifier_names

enum EnumTypePaymentEnum {
  VISTA(idTypePayment: 1, nameTypePayment: 'A VISTA'),
  PRAZO(idTypePayment: 2, nameTypePayment: 'A PRAZO'),
  CARTAO(idTypePayment: 3, nameTypePayment: 'CARTAO'),
  CHEQUE(idTypePayment: 4, nameTypePayment: 'CHEQUE'),
  TRANSFERENCIA(idTypePayment: 5, nameTypePayment: 'TRANSFERENCIA'),
  DEPOSITO(idTypePayment: 6, nameTypePayment: 'DEPOSITO'),
  BOLETO(idTypePayment: 7, nameTypePayment: 'BOLETO'),
  VIRTUAL(idTypePayment: 8, nameTypePayment: 'VIRTUAL');

  final int idTypePayment;
  final String nameTypePayment;
  const EnumTypePaymentEnum({
    required this.idTypePayment,
    required this.nameTypePayment,
  });
}
