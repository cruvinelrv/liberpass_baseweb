import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/geremetrika_page/geremetrika_page.dart';
import 'package:liberpass_baseweb/app/modules/central_base/sub_modules/wms/presentation/ui/pages/pages_item_management.dart';

import 'shared/presentation/ui/pages/base_page/base_page.dart';
import 'sub_modules/crm/presentation/ui/pages/person_page/person_page.dart';
import 'sub_modules/wms/presentation/cubits/item_page_cubit/item_page_cubit.dart';

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
        ChildRoute('/wms/', child: (context, args) => const ItemPage()),
        ChildRoute('/geremetrika/', child: (context, args) => const GeremetrikaPage()),
        ChildRoute('/crm/', child: (context, args) => const PersonPage()),
      ],
    )
  ];
}
