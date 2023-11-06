import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/onboarding/presentation/ui/pages/onboarding_basic_profile.dart';
import 'package:liberpass_baseweb/app/modules/onboarding/presentation/ui/pages/onboarding_page.dart';
import 'package:liberpass_baseweb/app/modules/onboarding/presentation/ui/pages/step_cities_page.dart';

class OnboardingModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const OnboardingPage()),
    ChildRoute('/basic_profile',
        child: (context, args) => const OnboardingBasicProfile()),
    ChildRoute('/cities_page',
        child: (context, args) => const StepCitiesPage()),
  ];
}
