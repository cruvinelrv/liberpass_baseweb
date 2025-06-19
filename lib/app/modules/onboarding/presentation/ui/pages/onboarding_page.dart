import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('onboarding_title').tr(),
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
          height: 300,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.language),
                        onPressed: () {
                          _showLanguageSelectionDialog(context);
                        },
                      ),
                    ],
                  ),
                  Text(
                    'onboarding_description'.tr(),
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('back_button_label').tr(),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Modular.to.navigate('/onboarding/cities_page');
                        },
                        child: const Text('next_button_label').tr(),
                      ),
                    ],
                  ),
                ],
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
          title: const Text('Select Language').tr(),
          content: DropdownButton<Locale>(
            value: context.locale,
            onChanged: (newLocale) {
              context.setLocale(newLocale!);
              Navigator.of(context)
                  .pop(); // Feche o diálogo após a seleção de idioma.
            },
            items: [
              DropdownMenuItem(
                value: const Locale('en', 'US'),
                child: const Text('English').tr(),
              ),
              DropdownMenuItem(
                value: const Locale('es', 'ES'),
                child: const Text('Español').tr(),
              ),
              DropdownMenuItem(
                value: const Locale('pt', 'BR'),
                child: const Text('Português').tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
