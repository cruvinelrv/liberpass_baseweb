import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/base_page/presentation/ui/pages/cubits/menu_cubit/menu_cubit.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/cubits/item_cubit/item_cubit.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/home_page/home_page.dart';

import 'auth_manager/login/presentation/ui/pages/login_page/login_page.dart';
import 'base_page/presentation/ui/pages/menu_page/menu_page.dart';
import 'error/presentation/ui/pages/error_page/error_page.dart';
import 'landing/presentation/ui/pages/landing_page.dart';

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
    ChildRoute('/login', child: (context, args) => const LoginPage()),
    ChildRoute('/home', child: (context, args) => const HomePage()),
    ChildRoute('/menu', child: (context, args) => const MenuPage()),
    ChildRoute('/error', child: (context, args) => const ErrorPage()),
  ];
}
