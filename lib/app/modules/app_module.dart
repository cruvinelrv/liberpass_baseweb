import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/cubits/item_cubit/item_cubit.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/home_page/home_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ItemCubit>((i) => ItemCubit(),
        onDispose: (cubit) async => cubit.close()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const HomePage()),
    ChildRoute('/home', child: (context, args) => const HomePage()),
  ];
}
