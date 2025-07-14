import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/onboarding/presentation/ui/pages/onboarding_step1_page.dart';

import 'package:liberpass_baseweb/app/modules/onboarding/presentation/ui/pages/onboarding_step2_objetivos_page.dart';

import 'package:liberpass_baseweb/app/modules/onboarding/presentation/cubits/onboarding_cubit/onboarding_cubit.dart';

import 'package:liberpass_baseweb/app/modules/onboarding/presentation/ui/pages/onboarding_finish_page.dart';
import 'package:liberpass_baseweb/app/modules/onboarding/presentation/ui/pages/onboarding_step2_page.dart';

class OnboardingModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(OnboardingCubit.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => OnboardingStep1Page(onNext: () => Modular.to.navigate('/onboarding/passo2')));
    r.child('/passo2',
        child: (context) => OnboardingStep2ObjetivosPage(onNext: () => Modular.to.navigate('/onboarding/passo3')));
    r.child('/passo3',
        child: (context) => OnboardingStep2Page(onConfirm: () {
              Modular.to.navigate('/onboarding/finalizacao');
            }));
    r.child('/finalizacao', child: (context) => const OnboardingFinishPage());
  }
}
