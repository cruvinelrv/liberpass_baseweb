import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Liberpass',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.transparent, // Define a cor do highlight/sublinhado como transparente
          // Opcional: Você também pode querer definir a cor do cursor e dos handles de seleção
          // cursorColor: Colors.green, // Exemplo: usar a cor primária do tema
          // selectionHandleColor: Colors.green, // Exemplo: usar a cor primária do tema
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white, // Cor do texto e ícones
        ),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
          secondary: Colors.greenAccent,
        ),
      ),
      routerConfig: Modular.routerConfig,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
