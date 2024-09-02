part of 'user_login_bloc.dart';

sealed class UserLoginEvent extends Equatable {
  const UserLoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends UserLoginEvent {
  final UserLogin userLogin;

  const LoginUser({required this.userLogin});

  @override
  List<Object> get props => [userLogin];
}
