import 'package:lpass_web_dependencies/web_dependencies.dart';

import 'presentation/ui/pages/error_page/error_page.dart';

class EscapeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const ErrorPage(),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 300),
    );
  }
}
