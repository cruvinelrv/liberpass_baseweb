import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:lpass_web_dependencies/web_dependencies.dart';

import 'app/config/application_config.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());

  await ApplicationConfig().configureApp();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES'), Locale('pt', 'BR')],
      path: 'translations',
      fallbackLocale: const Locale('pt', 'BR'),
      child: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}
