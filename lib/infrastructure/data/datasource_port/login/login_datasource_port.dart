import 'model/user_data.dart';

abstract class LoginDatasourcePort {
  Future<UserData?> login(String name, String password);
}
