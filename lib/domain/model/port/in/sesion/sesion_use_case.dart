import '../../../entity/user.dart';

abstract class SessionUseCasePort {
  String getUser();

  void setUser(String nameUser);

  logout();
}
