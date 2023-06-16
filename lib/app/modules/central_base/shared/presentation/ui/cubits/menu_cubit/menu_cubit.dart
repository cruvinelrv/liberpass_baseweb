import 'package:flutter_bloc/flutter_bloc.dart';
import 'states/states.dart';

class MenuCubit extends Cubit<MenuStates> {
  MenuCubit() : super(const MenuInitialState());

  void openMenu() => emit(MenuOpenState(isOpen: true));

  void closeMenu() => emit(MenuCloseState(isClose: false));
}
