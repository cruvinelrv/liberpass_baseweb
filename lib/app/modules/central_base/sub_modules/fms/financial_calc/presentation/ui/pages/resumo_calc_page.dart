import 'package:flutter/material.dart';

class ResumoCalcPage extends StatefulWidget {
  final double valorTotalFinanciamento;
  final int numeroParcelasPagas;
  const ResumoCalcPage({super.key, required this.valorTotalFinanciamento, required this.numeroParcelasPagas});

  @override
  State<ResumoCalcPage> createState() => _ResumoCalcPageState();
}

class _ResumoCalcPageState extends State<ResumoCalcPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Total Financiamento: ${widget.valorTotalFinanciamento}',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text(
            'Número de Parcelas Pagas: ${widget.numeroParcelasPagas}',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          // Text(
          //   'Valor Total Pago: $_valorTotalPago',
          //   style: const TextStyle(fontSize: 20),
          //   textAlign: TextAlign.center,
          // ),
          // Text(
          //   'Valor Restante para Pagar: $_valorRestantePagar',
          //   style: const TextStyle(fontSize: 20),
          //   textAlign: TextAlign.center,
          // ),
          // Text(
          //   'Número de Parcelas Restantes: $_numeroParcelasRestantes',
          //   style: const TextStyle(fontSize: 20),
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}
