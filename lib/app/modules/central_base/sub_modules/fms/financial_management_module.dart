import 'package:flutter_modular/flutter_modular.dart';

import 'financial_calc/presentation/ui/pages/financial_simulation_page.dart';

class FinancialManagementModule extends Module {

   @override
    void binds(i) {}

   @override
   void routes(r){
      r.child('/', child: (context) => const FinancialSimulationPage());
   }

}