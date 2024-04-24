import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/auth_manager/shared/guards/auth_guard.dart';
import 'package:liberpass_baseweb/app/modules/escape_manager/presentation/ui/pages/pages_escape_manager.dart';
import 'package:liberpass_baseweb/app/modules/escape_manager/presentation/ui/pages/under_construction_page/under_construction_page.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/geremetrika_page/geremetrika_page.dart';
import 'package:liberpass_baseweb/app/modules/central_base/sub_modules/scm/presentation/ui/pages/pages_item_management.dart';
import 'package:printing/printing.dart';

import '../auth_manager/login/presentation/cubits/auth_cubit/auth_cubit.dart';
import '../auth_manager/shared/session/session_manager.dart';
import '../escape_manager/presentation/ui/pages/permission_denied_page/permission_denied_page.dart';
import 'shared/presentation/ui/pages/base_page/base_page.dart';
import 'sub_modules/crm/presentation/ui/pages/person_page/person_page.dart';
import 'sub_modules/scm/presentation/cubits/item_page_cubit/item_page_cubit.dart';
import 'sub_modules/scm/presentation/ui/pages/order_page/order_page_original.dart';

class CentralBaseModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<AuthGuard>(AuthGuard.new);
    i.addSingleton<AuthCubit>(AuthCubit.new);
    i.addSingleton<SessionManager>(SessionManager.new);
    i.addSingleton<ItemPageCubit>(ItemPageCubit.new, config: BindConfig(onDispose: (cubit) async => cubit.close()));
  }

  @override
  void routes(r)  {
    r.child(
      '/',
      child: (context) => const BasePage(),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 300),
      guards: [AuthGuard()],
      children: [
        ChildRoute('/scm/', child: (context) => const ItemPage()),
        ChildRoute('/geremetrika/', child: (context) => const GeremetrikaPage()),
        ChildRoute('/crm/', child: (context) => const PersonPage()),
        ChildRoute('/under-construction/', child: (context) => const UnderConstructionPage()),
        ChildRoute('/order/', child: (context) => const OrderPage()),
        WildcardRoute(child: (context) => const UnderConstructionPage()),
      ],
    );
    r.child(
      '/denied/',
      child: (context) => const PermissionDeniedPage(),
    );
    r.wildcard(child: (context) => const UnderConstructionPage());
  }

  //final guardedRouteGenerator = AccessDeniedGuard().canActivate;
  /*
  Future<bool> Function(Route<dynamic> route, ParallelRoute<dynamic> router) get routeGenerator {
    final AuthGuard authGuard = Modular.get<AuthGuard>();
    return (Route<dynamic> route, ParallelRoute<dynamic> router) async {
      if (!(await authGuard.canActivate(route.settings.name!, router))) {
        await Modular.to.pushNamed('/denied');
        return false;
      }
      return true;
    };
  }
  */
}
