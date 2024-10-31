// authentication_state.dart
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoggedIn extends AuthenticationState {}

class AuthenticationLoggedOut extends AuthenticationState {}