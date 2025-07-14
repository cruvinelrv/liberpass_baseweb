import 'package:flutter/material.dart';
import '../../cubits/onboarding_cubit/onboarding_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingStep2ObjetivosPage extends StatefulWidget {
  final VoidCallback onNext;
  const OnboardingStep2ObjetivosPage({super.key, required this.onNext});

  @override
  State<OnboardingStep2ObjetivosPage> createState() => _OnboardingStep2ObjetivosPageState();
}

class _OnboardingStep2ObjetivosPageState extends State<OnboardingStep2ObjetivosPage> {
  late final OnboardingCubit _onboarding_cubit;
  String? objetivoSelecionado;
  String? errorText;

  final List<String> objetivos = [
    'Gestão financeira pessoal',
    'Gestão financeira do meu negócio',
    'Apenas mudar de cidade para ter mais qualidade de vida.'
  ];

  @override
  void initState() {
    super.initState();
    _onboarding_cubit = Modular.get<OnboardingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passo 2: Objetivos')),
      body: Container(
        color: const Color(0xFFF2F6FA),
        width: double.infinity,
        child: Center(
          child: Card(
            elevation: 8,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
              child: SizedBox(
                width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Selecione seus objetivos principais', style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 24),
                    ...objetivos.map((obj) => RadioListTile<String>(
                          title: Text(obj),
                          value: obj,
                          groupValue: objetivoSelecionado,
                          onChanged: (value) {
                            setState(() {
                              objetivoSelecionado = value;
                            });
                          },
                        )),
                    const SizedBox(height: 24),
                    if (errorText != null) Text(errorText!, style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if (objetivoSelecionado == null) {
                          setState(() {
                            errorText = 'Selecione um objetivo.';
                          });
                          return;
                        }
                        _onboarding_cubit.updateObjetivo(objetivoSelecionado!);
                        setState(() {
                          errorText = null;
                        });
                        widget.onNext();
                      },
                      child: const Text('Próximo'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
