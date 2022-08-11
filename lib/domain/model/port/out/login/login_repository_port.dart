import '../../../entity/user.dart';

abstract class LoginRepositoryPort{

  Future<User?> login(String name, String password);
  
}