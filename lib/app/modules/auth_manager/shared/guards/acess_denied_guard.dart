import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/auth_manager/shared/guards/auth_guard.dart';

class AccessDeniedGuard extends RouteGuard {
  @override
  Future<bool> canActivate(String path, ParallelRoute route) async {
    final AuthGuard authGuard = Modular.get<AuthGuard>();
    final canActivate = await authGuard.canActivate(path, route);

    if (canActivate) {
      Modular.to.navigate('/denied'); // Navigate to DeniedPage
    }

    return canActivate;
  }
}
