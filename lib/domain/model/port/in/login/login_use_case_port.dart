import '../../../entity/user.dart';

abstract class Login {

  Future<User?> login(String name, String password);
}
