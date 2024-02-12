import 'package:flutter_modular/flutter_modular.dart';

import 'financial_calc/presentation/ui/pages/financial_simulation_page.dart';

class FinancialManagementModule extends Module {

   @override
   final List<Bind> binds = [];

   @override
   final List<ModularRoute>  routes = [
      ChildRoute( Modular.initialRoute, child: (context,args) => const FinancialSimulationPage()),
      //ChildRoute('/', child: (context, args) => const ParcelasPagasPage())
   ];

}