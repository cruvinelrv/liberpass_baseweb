import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/session/session_manager.dart';

class AuthCubit extends Cubit<bool> {
  final SessionManager _sessionManager;

  AuthCubit(this._sessionManager) : super(false) {
    _sessionManager.sessionStream.listen((duration) {
      if (duration > 0) {
        emit(true);
      } else {
        emit(false);
      }
    });
  }

  void startSession() {
    _sessionManager.startSession();
  }

  void endSession() {
    _sessionManager.endSession();
  }

  @override
  Future<void> close() {
    _sessionManager.dispose();
    return super.close();
  }
}
