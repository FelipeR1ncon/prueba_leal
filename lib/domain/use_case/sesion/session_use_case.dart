import 'package:prueba_leal/domain/model/port/in/sesion/sesion_use_case.dart';
import 'package:prueba_leal/domain/model/port/out/sesion/session_repository_port.dart';

class SessionUseCase implements SessionUseCasePort {
  final SessionRepositoryPort _sessionRepository;

  SessionUseCase(this._sessionRepository);

  @override
  String getUser() {
    return _sessionRepository.getUser();
  }

  @override
  logout() {
    _sessionRepository.logout();
  }

  @override
  void setUser(String nameUser) {
    _sessionRepository.setUser(nameUser);
  }
}
