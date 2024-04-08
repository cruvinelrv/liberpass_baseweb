import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:meta_seo/meta_seo.dart';

import 'app/config/application_config.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());
  await ApplicationConfig().configureApp();
  // RenderMetaData(
  //     metaData: const MetaData(metaData: <String, dynamic>{
  //   'viewport': 'width=device-width, initial-scale=1.0',
  //   'description':
  //       'Aplicativo para buscar controle financeiro e da vida pessoal.',
  //   'keywords':
  //       'liberpass aplicativo controle financeiro pessoal investimentos passaporte liberdade nomade digital',
  //   'og:title': 'Liberpass - Aplicativo de gestao pessoal',
  //   'og:description':
  //       'Liberpass - o passaporte para sua liberdade financeira e pessoal',
  //   'og:image': 'https://liberpass.com.br/assets/assets/images/liber_pass.png',
  //   'twitter:title': 'Liberpass - Aplicativo de gestao pessoal',
  //   'twitter:description':
  //       'Liberpass - Passaporte para sua liberdade financeira e pessoal',
  //   'twitter:image':
  //       'https://liberpass.com.br/assets/assets/images/liber_pass.png',
  // }));
 
  //MetaSEO().config();
  //WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('pt', 'BR')
      ],
      path: 'translations', // Caminho para os arquivos de tradução
      fallbackLocale: const Locale('pt', 'BR'),
      child: // Idioma padrão
          ModularApp(module: AppModule(), child: const AppWidget())));
  //runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

// class LiberPassWeb extends StatelessWidget {
//   const LiberPassWeb({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Define MetaSEO object
//     MetaSEO meta = MetaSEO();
//     // Add meta seo data for web app as you want
//     meta.author(author: 'Vinicius Machado Cruvinel');
//     meta.description(
//         description:
//             'Aplicativo para buscar controle financeiro e da vida pessoal.');
//     meta.keywords(
//         keywords:
//             'liberpass aplicativo controle financeiro pessoal investimentos passaporte liberdade nomade digital');
//     meta.ogTitle(ogTitle: 'Liberpass');
//     meta.charset(charset: 'utf-8');
//     meta.propertyContent(
//       property: 'og:image',
//       content: 'https://liberpass.com.br/assets/images/logo.png',
//     );
//     meta.propertyContent(
//       property: 'twitter:image',
//       content: 'https://liberpass.com.br/assets/images/logo.png',
//     );
//     meta.propertyContent(
//       property: 'twitter:title',
//       content: 'Liberpass',
//     );
//     meta.propertyContent(
//       property: 'twitter:description',
//       content: 'Liberpass - Passaporte para sua liberdade financeira e pessoal',
//     );
//     meta.ogDescription(
//         ogDescription:
//             'Liberpass - o passaporte para sua liberdade financeira e pessoal');
//     meta.ogImage(ogImage: 'https://liberpass.com.br/assets/images/logo.png');
//     meta.twitterDescription(
//         twitterDescription:
//             'Liberpass - Passaporte para sua liberdade financeira e pessoal');
//     meta.twitterImage(
//         twitterImage: 'https://liberpass.com.br/assets/images/logo.png');
//     meta.twitterTitle(twitterTitle: 'Liberpass');

//     return MaterialApp(
//       title: 'Liberpass',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/login',
//       onGenerateRoute: Routes.onGenerateRoute,
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
