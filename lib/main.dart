import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:flutter/foundation.dart';

import 'app/routes/routes.dart';

void main() {
  if (kIsWeb) {
    MetaSEO().config();
  }
  runApp(const LiberPassWeb());
}

class LiberPassWeb extends StatelessWidget {
  const LiberPassWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // Add meta seo data for web app as you want
      meta.author(author: 'Vinicius Machado Cruvinel');
      meta.description(
          description:
              'Aplicativo para buscar controle financeiro e da vida pessoal.');
      meta.keywords(
          keywords:
              'liberpass aplicativo controle financeiro pessoal investimentos passaporte liberdade nomade digital');
      meta.ogDescription(
          ogDescription:
              'Liberpass - o passaporte para sua liberdade financeira e pessoal');
      meta.ogImage(ogImage: 'https://liberpass.com.br/assets/images/logo.png');
      meta.ogTitle(ogTitle: 'Liberpass');
      meta.twitterDescription(
          twitterDescription:
              'Liberpass - Passaporte para sua liberdade financeira e pessoal');
      meta.twitterImage(
          twitterImage: 'https://liberpass.com.br/assets/images/logo.png');
      meta.twitterTitle(twitterTitle: 'Liberpass');
    }
    return MaterialApp(
      title: 'Liberpass',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      onGenerateRoute: Routes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
