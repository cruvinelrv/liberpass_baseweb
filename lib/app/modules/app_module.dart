import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/base_page/presentation/ui/pages/cubits/menu_cubit/menu_cubit.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/cubits/item_cubit/item_cubit.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/home_page/home_page.dart';

import 'auth_manager/login/presentation/ui/pages/login_page/login_page.dart';
import 'base_page/presentation/ui/pages/menu_page/menu_page.dart';
import 'escape_manager/presentation/ui/pages/pages_escape_manager.dart';
import 'itens_management/presentation/ui/pages/pages_item_management.dart';
import 'itens_management/presentation/ui/pages/upload_itens_page/upload_itens_page.dart';
import 'landing/presentation/ui/pages/pages_landing.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ItemCubit>((i) => ItemCubit(),
        onDispose: (cubit) async => cubit.close()),
    Bind<MenuCubit>((i) => MenuCubit(),
        onDispose: (cubit) async => cubit.close()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const LandingPage()),
    ChildRoute('/liberpass-info',
        child: (context, args) => const LiberpassInfoPage()),
    ChildRoute('/login', child: (context, args) => const LoginPage()),
    ChildRoute('/home', child: (context, args) => const HomePage()),
    ChildRoute('/menu', child: (context, args) => const MenuPage()),
    ChildRoute('/add-item', child: (context, args) => const AddItemPage()),
    ChildRoute('/add-prices', child: (context, args) => const AddPricesPage()),
    ChildRoute('/upload-itens',
        child: (context, args) => const UploadItensPage()),
    ChildRoute('/item', child: (context, args) => const ItemPage()),
    ChildRoute('/error', child: (context, args) => const ErrorPage()),
    ChildRoute('/under-construction',
        child: (context, args) => const UnderConstructionPage()),
  ];
}
