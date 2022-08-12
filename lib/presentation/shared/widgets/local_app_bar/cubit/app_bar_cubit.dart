import 'package:bloc/bloc.dart';
import 'package:prueba_leal/domain/model/port/in/sesion/sesion_use_case.dart';

part 'app_bar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {
  final SessionUseCasePort _sessionUseCasePort;

  AppBarCubit(this._sessionUseCasePort) : super(AppBarState.inital);

  void closeSesion() {
    _sessionUseCasePort.logout();
    emit(AppBarState.closeSession);
  }
}
