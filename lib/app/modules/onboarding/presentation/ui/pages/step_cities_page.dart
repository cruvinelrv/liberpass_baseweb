import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class StepCitiesPage extends StatefulWidget {
  const StepCitiesPage({super.key});

  @override
  State<StepCitiesPage> createState() => _StepCitiesPageState();
}

class _StepCitiesPageState extends State<StepCitiesPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedOriginCity = 'Rio Verde - Goiás';
  String selectedDestinationCity = 'Poços de Caldas - Minas Gerais';
  String errorText = '';

  void validateCities() {
    if (selectedOriginCity == selectedDestinationCity) {
      setState(() {
        errorText = 'Selecione cidades diferentes';
      });
    } else {
      setState(() {
        errorText = '';
      });
    }
  }

  void _changeLanguage(Locale newLocale) {
    context.setLocale(newLocale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cities_page_title').tr(),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              _showLanguageSelectionDialog(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 120, 191, 227).withAlpha(200),
          width: 500,
          height: 350,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'select_cities_origin_destination'.tr(),
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedOriginCity,
                      items: <String>[
                        'Rio Verde - Goiás',
                        'Poços de Caldas - Minas Gerais',
                      ].map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedOriginCity = value!;
                        });
                        validateCities();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedDestinationCity,
                      items: <String>[
                        'Rio Verde - Goiás',
                        'Poços de Caldas - Minas Gerais',
                      ].map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDestinationCity = value!;
                        });
                        validateCities();
                      },
                      decoration: InputDecoration(
                        errorText: errorText.isNotEmpty ? errorText : null,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            // Implementar ação para voltar
                          },
                          child: const Text('back_button_label').tr(),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: (errorText.isEmpty)
                              ? () {
                                  // Implementar ação para avançar
                                }
                              : null,
                          child: const Text('next_button_label').tr(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('select_language').tr(),
          content: DropdownButton<Locale>(
            value: context.locale,
            onChanged: (newLocale) {
              _changeLanguage(newLocale!);
              Navigator.of(context)
                  .pop(); // Feche o diálogo após a seleção de idioma.
            },
            items: const [
              DropdownMenuItem(
                value: Locale('en', 'US'),
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: Locale('es', 'ES'),
                child: Text('Español'),
              ),
              DropdownMenuItem(
                value: Locale('pt', 'BR'),
                child: Text('Português'),
              ),
            ],
          ),
        );
      },
    );
  }
}
