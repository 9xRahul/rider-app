import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taxi_app/api/api.dart';

import 'package:taxi_app/screens/bloc/login_state.dart';

part 'login_event.dart';

class AuthBloc extends Bloc<LoginEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<LoginApiCallEvent>(_onLoginEvent);
  }

  Future<void> _onLoginEvent(
    LoginApiCallEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      
      print("api call done");

      String token = await Api().loginUser(
        username: event.username,
        password: event.password,
      );

      emit(AuthSuccessState(token: token));
    } catch (exception) {
      emit(AuthFailureState(message: exception.toString()));
    }
  }
}
