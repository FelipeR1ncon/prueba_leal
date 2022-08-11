import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_leal/domain/model/entity/user.dart';
import 'package:prueba_leal/domain/model/port/in/login/login_use_case_port.dart';
import 'package:prueba_leal/domain/use_case/login/login_use_case.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/login/login_datasource_port.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/login/model/user_data.dart';
import 'package:prueba_leal/infrastructure/respository/login/login_repository.dart';

class MockLoginDatasource extends Mock implements LoginDatasourcePort {}

void main() {
  late LoginDatasourcePort loginDatasourcePort;
  late LoginUseCasePort loginUseCasePort;

  late String name;
  late String password;

  setUp(() {
    loginDatasourcePort = MockLoginDatasource();
    loginUseCasePort = LoginUseCase(LoginRepository(loginDatasourcePort));

    name = "name";
    password = "passeword";
  });

  test('Cuando el usuario no existe, return null', () async {
    when(() => loginDatasourcePort.login(name, password))
        .thenAnswer((_) => Future.value(null));

    final result = await loginUseCasePort.login(name, password);
    expect(result, null);
  });

  test('Cuando el usuario existe, return user', () async {
    User userExpected = User(name, password);

    when(() => loginDatasourcePort.login(name, password))
        .thenAnswer((_) => Future.value(LoginResponse(name, password)));

    final result = await loginUseCasePort.login(name, password);
    expect(result, userExpected);
  });
}
