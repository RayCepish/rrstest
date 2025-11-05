part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

class AuthStarted extends AuthEvent {}

final class SignInRequestedEvent extends AuthEvent {
  final String email;
  final String password;
  const SignInRequestedEvent(this.email, this.password);
}

final class SignUpRequestedEvent extends AuthEvent {
  final String email;
  final String password;
  const SignUpRequestedEvent(this.email, this.password);
}

final class SignOutRequestedEvent extends AuthEvent {
  const SignOutRequestedEvent();
}
