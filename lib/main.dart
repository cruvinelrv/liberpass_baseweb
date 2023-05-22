import 'package:flutter/material.dart';
import 'package:liberpass_baseweb/app/core/modules/geremetrika/presentation/ui/pages/close_order_page/close_order_page.dart';
import 'package:liberpass_baseweb/app/core/modules/geremetrika/presentation/ui/pages/pdf_order_page/pdf_order_page.dart';

import 'app/core/routes/routes.dart';

void main() {
  runApp(const LiberPassWeb());
}

class LiberPassWeb extends StatelessWidget {
  const LiberPassWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liberpass Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      onGenerateRoute: Routes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
