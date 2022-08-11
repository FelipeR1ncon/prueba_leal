import '../../../entity/user.dart';

abstract class LoginUseCasePort {
  Future<User?> login(String name, String password);
}
