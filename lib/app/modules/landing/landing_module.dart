import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/landing/presentation/ui/pages/pages_landing.dart';

class LandingModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (context, args) => const LandingPage())];
}
