class FinancialCalcEntity {
  final String idFinancial;
  final int qtdParcelas;
  final double valorEntrada;
  final int mesInicio;
  final int anoInicio;
  final int dataVencimentoRecorrente;
  final double valorParcelaAtual;
  final double valorParcelaInicial;
  final double valorParcelaFinal;
  final int percentualReajuste;
  final double valorPagoAteMomento;
  final double valorAPagar;



  FinancialCalcEntity({
    required this.idFinancial,
    required this.qtdParcelas,
    required this.valorEntrada,
    required this.mesInicio,
    required this.anoInicio,
    required this.dataVencimentoRecorrente,
    required this.valorParcelaAtual,
    required this.valorParcelaInicial,
    required this.valorParcelaFinal,
    required this.percentualReajuste,
    required this.valorPagoAteMomento,
    required this.valorAPagar,
  });
}