import '../../../../domain/model/entity/user.dart';

abstract class SessionDatasourcePort {
  String getUser();

  void setUser(String user);

  logout();
}
