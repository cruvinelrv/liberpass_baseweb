import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'firebase_options.dart';

class ApplicationConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
     Modular.to.addListener(() {
    debugPrint('Rota: ${Modular.to.path}');
  });
    await _firebaseCoreConfig();
  }
}

Future<void> _firebaseCoreConfig() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
