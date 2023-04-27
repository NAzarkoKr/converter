part of 'nav_bar_cubit.dart';

enum NavbarItem { weather, converter }

class NavBarState extends Equatable {
  final NavbarItem navbarItem;
  final int index;
  const NavBarState({required this.index, required this.navbarItem});

  @override
  List<Object> get props => [index, navbarItem];
}
