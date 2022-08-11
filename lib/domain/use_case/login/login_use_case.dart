// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:prueba_leal/domain/model/entity/user.dart';
import 'package:prueba_leal/domain/model/port/in/login/login_use_case_port.dart';
import 'package:prueba_leal/domain/model/port/out/login/login_repository_port.dart';

class LoginUseCase implements LoginUseCasePort {
  final LoginRepositoryPort _repositoryPort;
  LoginUseCase(
    this._repositoryPort,
  );

  @override
  Future<User?> login(String name, String password) {
    return _repositoryPort.login(name, password);
  }
}
