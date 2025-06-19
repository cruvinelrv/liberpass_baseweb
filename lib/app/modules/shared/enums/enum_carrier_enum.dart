// ignore_for_file: constant_identifier_names

enum EnumCarrierEnum {
  CARTEIRA(idCarrier: 1, nameCarrier: 'CARTEIRA'),
  BANCO(idCarrier: 2, nameCarrier: 'BANCO'),
  JURIDICO(idCarrier: 3, nameCarrier: 'JURIDICO'),
  CORREIOS(idCarrier: 4, nameCarrier: 'CORREIOS'),
  TRANSPORTADORA(idCarrier: 5, nameCarrier: 'TRANSPORTADORA'),
  MOTOBOY(idCarrier: 6, nameCarrier: 'MOTOBOY'),
  AEREO(idCarrier: 7, nameCarrier: 'AEREO'),
  MARITIMO(idCarrier: 8, nameCarrier: 'MARITIMO'),
  FERROVIARIO(idCarrier: 9, nameCarrier: 'FERROVIARIO'),
  AGRUPADOR(idCarrier: 10, nameCarrier: 'AGRUPADOR'),
  OUTROS(idCarrier: 11, nameCarrier: 'OUTROS');

  final int idCarrier;
  final String nameCarrier;
  const EnumCarrierEnum({
    required this.idCarrier,
    required this.nameCarrier,
  });
}
