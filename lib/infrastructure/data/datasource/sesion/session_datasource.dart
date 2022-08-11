import 'package:prueba_leal/infrastructure/data/datasource_port/sesion/session_datasource_port.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const_shared_prefs.dart';

class SessionDatasource implements SessionDatasourcePort {
  final SharedPreferences _prefs;

  SessionDatasource(this._prefs);

  @override
  String getUser() {
    return _prefs.getString(ConstSharedPreference.userSesion) ?? "";
  }

  @override
  logout() {
    _prefs.clear();
  }

  @override
  void setUser(String user) {
    _prefs.setString(ConstSharedPreference.userSesion, user);
  }
}
