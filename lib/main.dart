import 'package:flutter/material.dart';

import 'app/routes/routes.dart';

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
