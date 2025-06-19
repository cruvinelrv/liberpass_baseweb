import 'package:flutter/material.dart';

class ParcelasListPage extends StatelessWidget {
  final int numeroParcela;
  final DateTime dataVencimento;
  final double valorParcela;

  const ParcelasListPage({
    Key? key,
    required this.numeroParcela,
    required this.dataVencimento,
    required this.valorParcela,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('Parcela $numeroParcela'),
      title: Text('Data de Vencimento: ${_formatDate(dataVencimento)}'),
      subtitle: Text('Valor: $valorParcela'),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
