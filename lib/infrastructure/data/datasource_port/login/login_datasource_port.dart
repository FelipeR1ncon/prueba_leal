import 'model/user_data.dart';

abstract class LoginDatasourcePort {
  Future<LoginResponse?> login(String name, String password);
}
