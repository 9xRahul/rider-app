import 'package:equatable/equatable.dart';
import 'package:taxi_app/models/UserModel.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String token;

  AuthSuccessState({required this.token});

  @override
  List<Object?> get props => [token];
}

class AuthFailureState extends AuthState {
  final String message;

  AuthFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
