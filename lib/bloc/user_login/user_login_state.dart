part of 'user_login_bloc.dart';

sealed class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object> get props => [];
}

final class UserLoginInitial extends UserLoginState {}

final class UserLoginLoading extends UserLoginState {}

final class UserLoginSuccess extends UserLoginState {
  final UserLogin userLogin;

  const UserLoginSuccess({required this.userLogin});

  @override
  List<Object> get props => [userLogin];
}

final class UserLoginError extends UserLoginState {
  final String message;

  const UserLoginError({required this.message});

  @override
  List<Object> get props => [message];
}
