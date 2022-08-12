// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_cubit.dart';

enum SplashStatus {
  initial,
  noLogogged,
  logged;
}

class SplashState extends Equatable {
  final SplashStatus status;
  final String nameUser;

  const SplashState(this.status, {this.nameUser = ""});

  @override
  List<Object?> get props => [status, nameUser];

  SplashState copyWith({
    SplashStatus? status,
    String? nameUser,
  }) {
    return SplashState(
      status ?? this.status,
      nameUser: nameUser ?? "",
    );
  }
}
