import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return webDev;
    } else {
      return webDev;
    }
  }

  static const FirebaseOptions webDev = FirebaseOptions(
    apiKey: "AIzaSyCWyWe0ehfbh4SORWFYxjeIUbu32ViJ_o0",
    authDomain: "liberpass-4b5d9.firebaseapp.com",
    projectId: "liberpass-4b5d9",
    storageBucket: "liberpass-4b5d9.appspot.com",
    messagingSenderId: "329544125931",
    appId: "1:329544125931:web:a714248ebe6eacdea7ddae",
    measurementId: "G-G4307HBM53",
  );
}
