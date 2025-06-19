import 'package:flutter/material.dart';
import '../../cubits/financial_calc_cubit.dart';

class AlertSimulationDetailPage extends StatefulWidget {
  final BuildContext context;
  final int numeroParcelasPagas;
  final int numeroParcelasRestantes;
  final double valorTotalFinanciamento;
  final int totalParcelas;

  const AlertSimulationDetailPage({
    super.key,
    required this.context,
    required this.numeroParcelasPagas,
    required this.numeroParcelasRestantes,
    required this.valorTotalFinanciamento,
    required this.totalParcelas,
  }) ;

  @override
  State<AlertSimulationDetailPage> createState() => _AlertSimulationDetailPageState();
}

class _AlertSimulationDetailPageState extends State<AlertSimulationDetailPage> {
  
  
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostrarAlertDialog(
        context: widget.context,
        numeroParcelasPagas: widget.numeroParcelasPagas,
        numeroParcelasRestantes: widget.numeroParcelasRestantes,
        valorTotalFinanciamento: widget.valorTotalFinanciamento,
        totalParcelas: widget.totalParcelas,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
 

  static void mostrarAlertDialog({required BuildContext context, required int numeroParcelasPagas, required int numeroParcelasRestantes, required double valorTotalFinanciamento, required int totalParcelas}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Parcelas Restantes'),
        content: SizedBox(
          height: 300,
          width: 600,
          child: ListView.builder(
            itemCount: numeroParcelasPagas,
            itemBuilder: (context, index) {
              final numeroParcela = numeroParcelasPagas + index + 1;
              final dataVencimento = FinancialCalcCubit.calcularDataVencimento(numeroParcela, totalParcelas ); // Corrigido para utilizar o ano atual
              return ListTile(
                title: Text('Parcela $numeroParcela - Data de Vencimento: $dataVencimento'),
                subtitle: Text('Valor: R\$ ${valorTotalFinanciamento / numeroParcela}'),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }
  
 
}

/*
showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Parcelas Restantes'),
        content: SizedBox(
          height: 300,
          width: 600,
          child: ListView.builder(
            itemCount: numeroParcelasRestantes,
            itemBuilder: (context, index) {
              final numeroParcela = numeroParcelasPagas + index + 1;
              final dataVencimento = FinancialCalcCubit.calcularDataVencimento(numeroParcela,  ); // Corrigido para utilizar o ano atual
              return ListTile(
                title: Text('Parcela $numeroParcela - Data de Vencimento: ${dataVencimento.day}/${dataVencimento.month}/${dataVencimento.year}'),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );

    */