import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/central_base/central_base_module.dart';
import 'package:liberpass_baseweb/app/modules/central_base/shared/presentation/ui/cubits/menu_cubit/menu_cubit.dart';
import 'package:liberpass_baseweb/app/modules/central_base/shared/presentation/ui/pages/internal_page/internal_page.dart';
import 'package:liberpass_baseweb/app/modules/central_base/sub_modules/crm/presentation/ui/pages/add_person_page/add_person_page.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/cubits/item_cubit/item_cubit.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/geremetrika_page/geremetrika_page.dart';

import 'auth_manager/auth_manager_module.dart';
import 'auth_manager/login/presentation/ui/pages/login_page/login_page.dart';
import 'central_base/shared/presentation/ui/pages/base_page/base_page.dart';
import 'central_base/sub_modules/crm/presentation/ui/pages/person_page/person_page.dart';
import 'escape_manager/presentation/ui/pages/pages_escape_manager.dart';
import 'central_base/sub_modules/wms/presentation/ui/pages/pages_item_management.dart';
import 'central_base/sub_modules/wms/presentation/ui/pages/upload_itens_page/upload_itens_page.dart';
import 'landing/landing_module.dart';
import 'landing/presentation/ui/pages/pages_landing.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ItemCubit>((i) => ItemCubit(), onDispose: (cubit) async => cubit.close()),
    Bind<MenuCubit>((i) => MenuCubit(), onDispose: (cubit) async => cubit.close()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LandingModule()),
    ModuleRoute('auth-manager', module: AuthManagerModule()),
    ModuleRoute('/central-base', module: CentralBaseModule()),
    ChildRoute('/base-page', child: (context, args) => const BasePage(), children: [
      ChildRoute('/internal-page',
          child: (context, args) => const InternalPage(
                title: 'title',
                color: Colors.red,
              )),
      ChildRoute('/geremetrika', child: (context, args) => const GeremetrikaPage()),
      ChildRoute('/wms', child: (context, args) => const ItemPage()),
      ChildRoute('/crm', child: (context, args) => const PersonPage()),
    ]),
    ChildRoute('/liberpass-info', child: (context, args) => const LiberpassInfoPage()),
    ChildRoute('/login', child: (context, args) => const LoginPage()),
    ChildRoute('/geremetrika', child: (context, args) => const GeremetrikaPage()),
    ChildRoute('/add-item', child: (context, args) => const AddItemPage()),
    ChildRoute('/add-prices', child: (context, args) => const AddPricesPage()),
    ChildRoute('/upload-itens', child: (context, args) => const UploadItensPage()),
    ChildRoute('/item', child: (context, args) => const ItemPage()),
    ChildRoute('/error', child: (context, args) => const ErrorPage()),
    ChildRoute('/under-construction', child: (context, args) => const UnderConstructionPage()),
    ChildRoute('/crm', child: (context, args) => const PersonPage()),
    ChildRoute('/add-person', child: (context, args) => AddPersonPage()),
  ];
}
