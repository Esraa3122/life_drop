import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_drop/core/enums/nav_bar_enum.dart';

part 'main_cubit_state.dart';
part 'main_cubit_cubit.freezed.dart';

class MainCubitCubit extends Cubit<MainCubitState> {
  MainCubitCubit() : super(const MainCubitState.initial());

  NavBarEnum navBarEnum = NavBarEnum.home;

  void selectedNavBarIcons(NavBarEnum viewEnum) {
    if (viewEnum == NavBarEnum.home) {
      navBarEnum = NavBarEnum.home;
    } else if (viewEnum == NavBarEnum.donors) {
      navBarEnum = NavBarEnum.donors;
    } else if (viewEnum == NavBarEnum.profile) {
      navBarEnum = NavBarEnum.profile;
    } else if (viewEnum == NavBarEnum.notifications) {
      navBarEnum = NavBarEnum.notifications;
    }
    emit(MainCubitState.barSelectedIcons(navBarEnum: navBarEnum));
  }
}
