import 'package:prueba_leal/domain/model/port/in/sesion/sesion_use_case.dart';
import 'package:prueba_leal/domain/model/port/out/sesion/session_repository_port.dart';


///Caso de uso encargado de manejar las sesion del usuario,se utiliza para
///almacenar una vez los datos del usuario  cuando
///inicia sesion y limpiarlos  cuando la cierra.
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
