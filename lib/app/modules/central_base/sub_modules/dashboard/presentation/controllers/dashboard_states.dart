abstract class DashboardState {}

class DashboardInitial extends DashboardState {
  final String title;
  DashboardInitial({this.title = 'Dashboard'});
}

// Exemplos de outros estados
class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final String title;
  DashboardLoaded(this.title);
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}
