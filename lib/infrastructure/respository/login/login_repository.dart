import 'package:prueba_leal/domain/model/entity/user.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/login/login_datasource_port.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/login/model/user_data.dart';

import '../../../domain/model/port/out/login/login_repository_port.dart';

class LoginRepository implements LoginRepositoryPort {
  final LoginDatasourcePort _loginDatasourcePort;

  LoginRepository(this._loginDatasourcePort);

  @override
  Future<User?> login(String name, String password) async {
    LoginResponse? userData = await _loginDatasourcePort.login(name, password);

    if (userData != null) {
      return User(userData.name, userData.password);
    }

    return null;
  }
}
