import 'dart:async';
import 'dart:html' as html;

class WebListenersConfig {
  static bool reloaded = false;

  static void redirectRoute(bool confirmation) {
    html.window.location.replace('/login_page');
  }

  initializeWebListeners(){
    final completer = Completer<void>();
    html.window.onKeyDown.listen((html.KeyboardEvent event) {
      if (event.keyCode == html.KeyCode.F5 || reloaded) {
        event.preventDefault();
        showMessageConfirmation(pressedBackButton: false, pressedReloadButton: true);

      }
    });

    html.window.onPopState.listen((html.Event event) {
      event.preventDefault();
      showMessageConfirmation(pressedBackButton: true, pressedReloadButton: false);
    });

    html.window.onBeforeUnload.listen((html.Event event) {
      event.preventDefault();
      showMessageConfirmation(pressedBackButton: true, pressedReloadButton: false);
    });

    completer.complete();
    return completer.future;
  }

  void showMessageConfirmation({required bool pressedBackButton, required bool pressedReloadButton}) {
    bool confirmation = false;
    if (pressedBackButton) {
      confirmation = html.window.confirm('Deseja voltar para a página anterior.');
    } else if (pressedReloadButton) {
      confirmation = html.window.confirm('Deseja recarregar a página. Sua sessão será encerrada.');
    }
    confirmation ? redirectRoute(confirmation) : html.window.history.pushState(null, '', html.window.location.href);
  }
}
