import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../cubits/financial_calc_cubit.dart';
import '../widgets/alert_simulation_detail_page.dart';
import 'resumo_calc_page.dart';

class FinancialSimulationPage extends StatefulWidget {
  const FinancialSimulationPage({Key? key}) : super(key: key);

  @override
  State<FinancialSimulationPage> createState() => _FinancialSimulationPageState();
}

class _FinancialSimulationPageState extends State<FinancialSimulationPage> {
  final TextEditingController _totalParcelasController = TextEditingController();
  final TextEditingController _qtdParcelasPagasController = TextEditingController();
  final TextEditingController _mesInicioController = TextEditingController();
  final TextEditingController _anoInicioController = TextEditingController();
  final TextEditingController _valorEntradaController = TextEditingController();
  final TextEditingController _valorParcelaAtualController = TextEditingController();
  final TextEditingController _valorPagoAteMomentoController = TextEditingController();

  
  double _valorTotalPago = 0;
  double _valorRestantePagar = 0;
  int _numeroParcelasRestantes = 0;
  double valorTotalFinanciamento = 0;
  int numeroParcelasPagas = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Parcelas Pagas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _totalParcelasController,
                decoration: const InputDecoration(labelText: 'Total de Parcelas'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _qtdParcelasPagasController,
                decoration: const InputDecoration(labelText: 'Quantidade de Parcelas Pagas'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _mesInicioController,
                decoration: const InputDecoration(labelText: 'Mês Inicial (1-12)'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                maxLength: 2,
              ),
              TextField(
                controller: _anoInicioController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                maxLength: 4,
                decoration: const InputDecoration(labelText: 'Ano Inicial', hintText: 'Ex: 1985'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _valorEntradaController,
                decoration: const InputDecoration(labelText: 'Valor de Entrada'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _valorParcelaAtualController,
                decoration: const InputDecoration(labelText: 'Valor da Parcela Atual'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _valorPagoAteMomentoController,
                decoration: const InputDecoration(labelText: 'Valor Pago Até o Momento'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // calcularParcelasPagas();
                  // mostrarParcelasRestantes();
                  setState(() {
                    calcularStatusFinanciamento();
                  });
                },
                child: const Text('Calcular'),
              ),
              const SizedBox(height: 20),
              ResumoCalcPage(valorTotalFinanciamento: valorTotalFinanciamento, numeroParcelasPagas: numeroParcelasPagas),
            ],
          ),
        ),
    );
  }

  void calcularStatusFinanciamento(){
    int totalParcelas = int.tryParse(_totalParcelasController.text) ?? 0;
    numeroParcelasPagas = int.tryParse(_qtdParcelasPagasController.text) ?? 0;
    double valorParcelaAtual = double.tryParse(_valorParcelaAtualController.text) ?? 0;
    double valorEntrada = double.tryParse(_valorEntradaController.text) ?? 0;
    double valorPagoAteMomento = double.tryParse(_valorPagoAteMomentoController.text) ?? 0;
    valorTotalFinanciamento =
    FinancialCalcCubit.calcularValorTotalFinanciamento(numeroParcelasPagas, valorParcelaAtual, valorEntrada, valorPagoAteMomento);
    showDialog(context: context, builder: (context) => AlertSimulationDetailPage(context: context, numeroParcelasPagas: numeroParcelasPagas, numeroParcelasRestantes: _numeroParcelasRestantes, valorTotalFinanciamento: valorTotalFinanciamento, totalParcelas: totalParcelas));
    //AlertSimulationDetailPage.mostrarAlertDialog(context: context, numeroParcelasPagas: numeroParcelasPagas, numeroParcelasRestantes: _numeroParcelasRestantes);   

       //( context: context,valorTotalFinanciamento: valorTotalFinanciamento, numeroParcelasPagas: numeroParcelasPagas, numeroParcelasRestantes: _numeroParcelasRestantes);
  }

  void calcularParcelasPagas() {
    int totalParcelas = int.tryParse(_totalParcelasController.text) ?? 0;
    int mesInicio = int.tryParse(_mesInicioController.text) ?? 1;
    int anoInicio = int.tryParse(_anoInicioController.text) ?? DateTime.now().year;
    double valorEntrada = double.tryParse(_valorEntradaController.text) ?? 0;
    double valorParcelaAtual = double.tryParse(_valorParcelaAtualController.text) ?? 0;
    double valorPagoAteMomento = double.tryParse(_valorPagoAteMomentoController.text) ?? 0;

    if (mesInicio < 1 || mesInicio > 12) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro'),
          content: const Text('Por favor, insira um mês válido (1-12).'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    DateTime dataInicio = DateTime(anoInicio, mesInicio);
    DateTime dataAtual = DateTime.now();

    int anosDiferenca = dataAtual.year - dataInicio.year;
    int mesesDiferenca = dataAtual.month - dataInicio.month;
    int numeroParcelasPagas = anosDiferenca * 12 + mesesDiferenca + 1;

    //_valorTotalPago = FinancialCalcCubit.calcularValorTotalPago(numeroParcelasPagas, valorParcelaAtual, valorEntrada, valorPagoAteMomento);
    _valorRestantePagar = FinancialCalcCubit.calcularValorRestantePagar(totalParcelas, numeroParcelasPagas, valorParcelaAtual, _valorTotalPago);
    _numeroParcelasRestantes = FinancialCalcCubit.calcularNumeroParcelasRestantes(totalParcelas, numeroParcelasPagas);

    
  }

  
}
