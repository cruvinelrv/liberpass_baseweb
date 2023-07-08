import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/central-base/denied/');
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute<dynamic> route) {
    const bool profile = true;
    if (profile == true) {
      return true;
    } else {
      return false;
    }
  }
}
