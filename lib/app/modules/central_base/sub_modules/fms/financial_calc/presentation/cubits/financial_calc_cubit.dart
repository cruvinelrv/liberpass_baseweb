
class FinancialCalcCubit {
  static double calcularValorTotalFinanciamento(int numeroParcelasPagas, double valorParcelaAtual, double valorEntrada, double valorPagoAteMomento) {
    return valorEntrada + (numeroParcelasPagas * valorParcelaAtual) + valorPagoAteMomento;
  }

  static double calcularValorRestantePagar(int totalParcelas, int numeroParcelasPagas, double valorParcelaAtual, double valorTotalPago) {
    return (totalParcelas * valorParcelaAtual) - valorTotalPago;
  }

  static int calcularNumeroParcelasRestantes(int totalParcelas, int numeroParcelasPagas) {
    return totalParcelas - numeroParcelasPagas;
  }

  static DateTime calcularDataVencimento(int numeroParcela, int totalParcelas) {
    DateTime dataAtual = DateTime.now();
    int mesAtual = dataAtual.month;
    int anoAtual = dataAtual.year;
    
    int mesesVencimento = mesAtual + numeroParcela;
    int anoVencimento = anoAtual;

    while (mesesVencimento > 12) {
      mesesVencimento -= 12;
      anoVencimento++;
    }

    return DateTime(anoVencimento, mesesVencimento, dataAtual.day);
  }
}
