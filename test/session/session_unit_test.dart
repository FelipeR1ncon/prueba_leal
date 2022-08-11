import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_leal/domain/model/port/in/sesion/sesion_use_case.dart';
import 'package:prueba_leal/domain/use_case/sesion/session_use_case.dart';
import 'package:prueba_leal/infrastructure/data/datasource/const_shared_prefs.dart';
import 'package:prueba_leal/infrastructure/data/datasource/sesion/session_datasource.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/sesion/session_datasource_port.dart';
import 'package:prueba_leal/infrastructure/respository/sesion/session_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SessionDatasourcePort sessionDatasourcePort;
  late SessionUseCasePort sessionUseCasePort;
  late SharedPreferences preferences;

  const String userInSession = "maria";

  setUp(() async {
    Map<String, Object> values = {
      ConstSharedPreference.userSesion: userInSession
    };
    SharedPreferences.setMockInitialValues(values);
    preferences = await SharedPreferences.getInstance();
    sessionDatasourcePort = SessionDatasource(preferences);
    sessionUseCasePort =
        SessionUseCase(SessionRepository(sessionDatasourcePort));
  });

  test('Cuando el usuario NO existe, return string vacio', () async {
    SharedPreferences.setMockInitialValues({});
    preferences = await SharedPreferences.getInstance();
    sessionDatasourcePort = SessionDatasource(preferences);
    sessionUseCasePort =
        SessionUseCase(SessionRepository(sessionDatasourcePort));
    sessionUseCasePort =
        SessionUseCase(SessionRepository(sessionDatasourcePort));
    final result = sessionUseCasePort.getUser();
    expect(result, "");
  });

  test('Cuando el usuario existe, return nombre de usuario', () async {
    final result = sessionUseCasePort.getUser();
    expect(result, userInSession);
  });

  test('Cuando el caso de uso llama a clearData,se limpia el usuario ',
      () async {
    final result = sessionUseCasePort.getUser();
    expect(result, userInSession);

    sessionUseCasePort.logout();
    final newResult = sessionUseCasePort.getUser();

    expect(newResult, '');
  });

  test('Cuando el caso de uso llama a setUser,se cambia el usuario ', () async {
    final result = sessionUseCasePort.getUser();
    expect(result, userInSession);

    String newNameExpected = "NUEVO";
    sessionUseCasePort.setUser(newNameExpected);
    final newResult = sessionUseCasePort.getUser();

    expect(newResult, newNameExpected);
  });
}
