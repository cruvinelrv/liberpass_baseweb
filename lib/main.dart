import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'app/config/application_config.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());
  await ApplicationConfig().configureApp();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES'), Locale('pt', 'BR')],
      path: 'translations',
      fallbackLocale: const Locale('pt', 'BR'),
      child: ModularApp(module: AppModule(), child: const AppWidget()),
    ),
  );
}
