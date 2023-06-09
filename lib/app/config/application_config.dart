import 'package:flutter/material.dart';
//import 'package:intl/date_symbol_data_http_request.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class ApplicationConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    //initializeDateFormatting('pt_BR', '');
    await _firebaseCoreConfig();
  }
}

Future<void> _firebaseCoreConfig() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
