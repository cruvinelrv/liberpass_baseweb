import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardState {
  final String title;
  const DashboardState({this.title = 'Dashboard'});

  DashboardState copyWith({String? title}) {
    return DashboardState(title: title ?? this.title);
  }
}

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  void setTitle(String value) {
    emit(state.copyWith(title: value));
  }

  // Adicione métodos e lógica conforme necessário
}
