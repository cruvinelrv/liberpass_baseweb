import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/auth_manager/login/presentation/ui/pages/login_page/login_page.dart';

class AuthManagerModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const LoginPage(),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 300),
    )
  ];
}
