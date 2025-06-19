import 'package:flutter/material.dart';
import 'package:liberpass_baseweb/app/modules/landing/presentation/ui/pages/liber_plan_page/widgets/widget_build_card_column.dart';
import 'package:liberpass_baseweb/app/modules/landing/presentation/ui/pages/liber_plan_page/widgets/widget_build_card_row.dart';

class PlanEntity {
  final String name;
  final double price;
  final List<String> features;

  const PlanEntity({
    required this.name,
    required this.price,
    required this.features,
  });
}

class LiberPlanPage extends StatelessWidget {
  final List<PlanEntity> plans = [
    PlanEntity(
      name: 'Plano Free',
      price: 0.00,
      features: [
        'Crie seu perfil',
        'Nosso objetivo é buscar a liberdade de viver bem',
        'Participe da comunidade Liberpass',
      ],
    ),
    //TODO: No momento vamos suspender os outros planos
    // Plan(
    //   name: 'Plano Start',
    //   price: 120.00,
    //   features: [
    //     // Construindo sobre o Free, adicionando mais profundidade e ferramentas
    //     'Tudo do Plano Free, e mais:',
    //     'Ferramentas avançadas para planejamento de lazer e viagens',
    //     'Acesso a roteiros e sugestões de atividades (natureza, trilhas, etc.)',
    //     'Planejamento detalhado de cursos e certificações',
    //     'Ferramentas de gestão para autônomos e micro-empreendedores (1 CNPJ, 1 Usuário)', // Introduzindo ferramentas profissionais de forma mais branda
    //     'Estoque básico, Cadastro Clientes/Fornecedores',
    //     'Pedido básico, Pagar/Receber',
    //     'Acesso a conteúdo e workshops sobre desenvolvimento profissional',
    //     'Suporte prioritário',
    //   ],
    // ),
    // Plan(
    //   name: 'Plano Up',
    //   price: 250.00,
    //   features: [
    //     // Escalando e adicionando mais recursos
    //     'Tudo do Plano Start, e mais:',
    //     'Ferramentas de análise de progresso pessoal e profissional',
    //     'Acesso a conteúdos premium e webinars',
    //     'Escalabilidade para pequenas empresas (1 CNPJ, 2 Usuários)', // Escalando ferramentas profissionais
    //     'Funcionalidades aprimoradas de Estoque, Clientes, Fornecedores',
    //     'Relatórios básicos de gestão',
    //     'Impressão de pedido personalizável',
    //     'Suporte dedicado',
    //   ],
    // ),
    // Plan(
    //   name: 'Plano Top',
    //   price: 450.00,
    //   features: [
    //     // Mais escala e recursos premium
    //     'Tudo do Plano Up, e mais:',
    //     'Mentorias em grupo sobre temas específicos (Carreira, Bem-estar, etc.)',
    //     'Acesso a eventos exclusivos da comunidade',
    //     'Suporte MultiEmpresa (Até 3 CNPJs)', // Escalando significativamente o profissional
    //     'Gestão de múltiplos usuários por empresa (1 Usuário por CNPJ)',
    //     'Funcionalidades avançadas de Pedido e Pagar/Receber',
    //     'Relatórios analíticos',
    //     'Integrações básicas com outras ferramentas',
    //   ],
    // ),
    // Plan(
    //   name: 'Plano Premium',
    //   price: 1200.00,
    //   features: [
    //     // O plano mais completo
    //     'Tudo do Plano Top, e mais:',
    //     'Mentorias individuais e personalizadas',
    //     'Conteúdo exclusivo e acesso antecipado a novos recursos',
    //     'Suporte MultiEmpresa aprimorado (Até 3 CNPJs)',
    //     'Gestão de múltiplos usuários por empresa (3 Usuários por CNPJ)', // Mais usuários
    //     'Funcionalidades completas de Estoque, Clientes, Fornecedores, Pedidos, Pagar/Receber',
    //     'Relatórios completos e customizáveis',
    //     'API para integrações customizadas',
    //     'Suporte VIP',
    //   ],
    // ),
  ];

  LiberPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: WidgetBuildCardRow(plans: plans),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: WidgetBuildCardColumn(plans: plans),
          );
        }
      },
    );
  }
}
