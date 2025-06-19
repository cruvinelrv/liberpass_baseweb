import 'package:flutter/material.dart';
import 'package:liberpass_baseweb/app/modules/landing/presentation/ui/pages/liber_plan_page/widgets/widget_build_card_column.dart';
import 'package:liberpass_baseweb/app/modules/landing/presentation/ui/pages/liber_plan_page/widgets/widget_build_card_row.dart';

class Plan {
  final String name;
  final double price;
  final List<String> features;

  Plan({required this.name, required this.price, required this.features});
}

class LiberPlanPage extends StatelessWidget {
  final List<Plan> plans = [
    Plan(
      name: 'Plano Free',
      price: 0.00,
      features: [
        'Tem um negócio e não tem CNPJ',
        'Pedido simples',
        'Não armazena nenhum cadastro e pedidos',
        'Impressão de pedido',
      ],
    ),
    Plan(
      name: 'Plano Start',
      price: 120.00,
      features: [
        'Apenas 1 CNPJ',
        '1 Usuário',
        'Estoque',
        'Cadastro de Clientes',
        'Cadastro de Fornecedores',
        'Pedido básico',
        'Impressão de pedido',
        'Pagar e Receber'
      ],
    ),
    Plan(
      name: 'Plano Up',
      price: 250.00,
      features: [
        'Apenas 1 CNPJ',
        '2 Usuários',
        'Estoque',
        'Cadastro de Clientes',
        'Cadastro de Fornecedores',
        'Pedido básico',
        'Impressão de pedido',
        'Pagar e Receber'
      ],
    ),
    Plan(
      name: 'Plano Top',
      price: 450.00,
      features: [
        'MultiEmpresa',
        'Até 3 CNPJs',
        '1 Usuário por empresa',
        'Estoque',
        'Cadastro de Clientes',
        'Cadastro de Fornecedores',
        'Pedido básico',
        'Impressão de pedido',
        'Pagar e Receber'
      ],
    ),
    Plan(
      name: 'Plano Premium',
      price: 1200.00,
      features: [
        'MultiEmpresa',
        'Até 3 CNPJs',
        '3 Usuário por empresa',
        'Estoque',
        'Cadastro de Clientes',
        'Cadastro de Fornecedores',
        'Pedido com mais opções',
        'Impressão de pedido',
        'Pagar e Receber'
      ],
    ),
  ];

  LiberPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return WidgetBuildCardRow(plans: plans);
        } else {
          return WidgetBuildCardColumn(plans: plans);
        }
      },
    );
  }
}
