import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit()
      : super(const NavBarState(navbarItem: NavbarItem.weather, index: 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.weather:
        emit(const NavBarState(navbarItem: NavbarItem.weather, index: 0));
        break;
      case NavbarItem.converter:
        emit(const NavBarState(navbarItem: NavbarItem.converter, index: 1));
        break;
    }
  }
}
