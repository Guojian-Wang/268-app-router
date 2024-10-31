import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';



class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LogInEvent>((event, emit) => emit(AuthenticationLoggedIn()));
    on<LogOutEvent>((event, emit) => emit(AuthenticationLoggedOut()));
  }
}