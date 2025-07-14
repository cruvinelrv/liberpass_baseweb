import 'package:flutter/material.dart';
import 'package:lpass_web_dependencies/web_dependencies.dart';
import '../../cubits/onboarding_cubit/onboarding_cubit.dart';

// Lista simplificada de estados e cidades brasileiras
const Map<String, List<String>> cidadesPorEstado = {
  'SP': ['São Paulo', 'Campinas', 'Santos'],
  'RJ': ['Rio de Janeiro', 'Niterói', 'Petrópolis'],
  'MG': ['Belo Horizonte', 'Uberlândia', 'Poços de Caldas'],
  'GO': ['Goiânia', 'Rio Verde', 'Anápolis'],
};

class OnboardingStep1Page extends StatefulWidget {
  final VoidCallback onNext;
  const OnboardingStep1Page({super.key, required this.onNext});

  @override
  State<OnboardingStep1Page> createState() => _OnboardingStep1PageState();
}

class _OnboardingStep1PageState extends State<OnboardingStep1Page> {
  late final OnboardingCubit _onboarding_cubit;
  String? estadoOrigem;
  String? cidadeOrigem;
  String? estadoDestino;
  String? cidadeDestino;
  String? errorText;
  bool permanecerNaCidade = false;

  @override
  void initState() {
    super.initState();
    _onboarding_cubit = Modular.get<OnboardingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passo 1: Cidades')),
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
                    const Text('Selecione sua cidade de origem e destino', style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 24),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Estado de Origem'),
                      value: estadoOrigem,
                      items: cidadesPorEstado.keys.map((uf) => DropdownMenuItem(value: uf, child: Text(uf))).toList(),
                      onChanged: (uf) {
                        setState(() {
                          estadoOrigem = uf;
                          cidadeOrigem = null;
                          if (permanecerNaCidade) {
                            estadoDestino = uf;
                            cidadeDestino = cidadeOrigem;
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Cidade de Origem'),
                      value: cidadeOrigem,
                      items: estadoOrigem == null
                          ? []
                          : cidadesPorEstado[estadoOrigem!]!
                              .map((cidade) => DropdownMenuItem(value: cidade, child: Text(cidade)))
                              .toList(),
                      onChanged: (cidade) {
                        setState(() {
                          cidadeOrigem = cidade;
                          if (permanecerNaCidade) {
                            cidadeDestino = cidade;
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    CheckboxListTile(
                      title: const Text('Quero permanecer na cidade de origem'),
                      value: permanecerNaCidade,
                      onChanged: (value) {
                        setState(() {
                          permanecerNaCidade = value ?? false;
                          if (permanecerNaCidade) {
                            estadoDestino = estadoOrigem;
                            cidadeDestino = cidadeOrigem;
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Estado de Destino'),
                      value: estadoDestino,
                      items: cidadesPorEstado.keys.map((uf) => DropdownMenuItem(value: uf, child: Text(uf))).toList(),
                      onChanged: permanecerNaCidade
                          ? null
                          : (uf) {
                              setState(() {
                                estadoDestino = uf;
                                cidadeDestino = null;
                              });
                            },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Cidade de Destino'),
                      value: cidadeDestino,
                      items: estadoDestino == null
                          ? []
                          : cidadesPorEstado[estadoDestino!]!
                              .map((cidade) => DropdownMenuItem(value: cidade, child: Text(cidade)))
                              .toList(),
                      onChanged: permanecerNaCidade
                          ? null
                          : (cidade) {
                              setState(() {
                                cidadeDestino = cidade;
                              });
                            },
                    ),
                    const SizedBox(height: 24),
                    if (errorText != null) Text(errorText!, style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if (cidadeOrigem == null || cidadeDestino == null) {
                          setState(() {
                            errorText = 'Selecione ambas as cidades.';
                          });
                          return;
                        }
                        if (!permanecerNaCidade && cidadeOrigem == cidadeDestino && estadoOrigem == estadoDestino) {
                          setState(() {
                            errorText = 'Cidades de origem e destino devem ser diferentes.';
                          });
                          return;
                        }
                        _onboarding_cubit.updateCidadeOrigem('${cidadeOrigem!} - ${estadoOrigem!}');
                        _onboarding_cubit.updateCidadeDestino('${cidadeDestino!} - ${estadoDestino!}');
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
