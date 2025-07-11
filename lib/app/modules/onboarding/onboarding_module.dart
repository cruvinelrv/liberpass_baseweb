import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/onboarding/presentation/ui/pages/multi_step_form_page.dart';
import 'package:liberpass_baseweb/app/modules/onboarding/presentation/ui/pages/onboarding_basic_profile.dart';
import 'package:liberpass_baseweb/app/modules/onboarding/presentation/ui/pages/step_cities_page.dart';

class OnboardingModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const MultiStepForm());
    r.child('/basic_profile', child: (context) => const OnboardingBasicProfile());
    r.child('/cities_page', child: (context) => const StepCitiesPage());
  }
}
