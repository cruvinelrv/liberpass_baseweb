import 'dart:async';

class SessionManager {
  Timer? _sessionTimer;
  int _sessionDuration = 0;

  final StreamController<int> _sessionStreamController = StreamController<int>.broadcast();
  Stream<int> get sessionStream => _sessionStreamController.stream;

  void startSession() {
    _sessionDuration = 0;
    _sessionTimer?.cancel();
    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _sessionDuration++;
      _sessionStreamController.add(_sessionDuration);
    });
  }

  void endSession() {
    _sessionTimer?.cancel();
    _sessionDuration = 0;
    _sessionStreamController.add(_sessionDuration);
  }

  void dispose() {
    _sessionTimer?.cancel();
    _sessionStreamController.close();
  }
}
