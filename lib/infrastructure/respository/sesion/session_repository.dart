import 'package:prueba_leal/domain/model/port/out/sesion/session_repository_port.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/sesion/session_datasource_port.dart';

class SessionRepository implements SessionRepositoryPort {
  final SessionDatasourcePort _sessionDatasourcePort;

  SessionRepository(this._sessionDatasourcePort);

  @override
  String getUser() {
    return _sessionDatasourcePort.getUser();
  }

  @override
  logout() {
    _sessionDatasourcePort.logout();
  }

  @override
  void setUser(String user) {
    _sessionDatasourcePort.setUser(user);
  }
}
