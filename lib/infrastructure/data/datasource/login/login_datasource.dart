import 'package:prueba_leal/infrastructure/data/datasource_port/login/login_datasource_port.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/login/model/user_data.dart';

class LoginDatasource implements LoginDatasourcePort {
  final List<LoginResponse> _users = [
    LoginResponse("maria", "password"),
    LoginResponse("pedro", "123456")
  ];

  @override
  Future<LoginResponse?> login(String name, String password) {
    return Future.delayed(const Duration(milliseconds: 300), () {
      LoginResponse userData = _users.firstWhere(
          (element) => element.name == name && element.password == password,
          orElse: () {
        return LoginResponse("", "");
      });
      if (userData.name.isNotEmpty) {
        return userData;
      }
      return null;
    });
  }
}
