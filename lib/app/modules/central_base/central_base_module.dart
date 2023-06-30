import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/escape_manager/presentation/ui/pages/under_construction_page/under_construction_page.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/geremetrika_page/geremetrika_page.dart';
import 'package:liberpass_baseweb/app/modules/central_base/sub_modules/scm/presentation/ui/pages/pages_item_management.dart';

import 'shared/presentation/ui/pages/base_page/base_page.dart';
import 'sub_modules/crm/presentation/ui/pages/person_page/person_page.dart';
import 'sub_modules/scm/presentation/cubits/item_page_cubit/item_page_cubit.dart';
import 'sub_modules/scm/presentation/ui/pages/order_page/order_page_original.dart';

class CentralBaseModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<ItemPageCubit>((i) => ItemPageCubit(), onDispose: (cubit) async => cubit.close()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const BasePage(),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 300),
      children: [
        ChildRoute('/scm/', child: (context, args) => const ItemPage()),
        ChildRoute('/geremetrika/', child: (context, args) => const GeremetrikaPage()),
        ChildRoute('/crm/', child: (context, args) => const PersonPage()),
        ChildRoute('/under-construction/', child: (context, args) => const UnderConstructionPage()),
        ChildRoute('/order/', child: (context, args) => const OrderPage()),
      ],
    )
  ];
}
