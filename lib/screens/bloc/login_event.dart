part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginApiCallEvent extends LoginEvent {
  final String username;
  final String password;

  LoginApiCallEvent({required this.username, required this.password});
}
