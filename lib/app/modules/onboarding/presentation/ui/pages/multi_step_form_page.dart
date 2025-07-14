// multi_step_form.dart
import 'package:flutter/material.dart';
import 'package:liberpass_baseweb/app/modules/onboarding/presentation/ui/pages/step_3_page.dart';

import 'step1_page.dart';
import 'step2_page.dart';

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({super.key});

  @override
  State<MultiStepForm> createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        Step1Page(onNext: () => _nextPage()),
        Step2Page(onNext: () => _nextPage()),
        Step3Page(onNext: () => _nextPage()),
      ],
    );
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      // O formulário está completo, você pode implementar a lógica de envio aqui
      // ou navegar para outra tela, dependendo dos requisitos do seu aplicativo.
      print('Formulário Completo');
    }
  }
}
