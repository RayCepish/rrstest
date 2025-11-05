import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rockettest/domain/repository/auth_repository.dart';
import 'package:rockettest/domain/usecases/signin_usecase.dart';
import 'package:rockettest/domain/usecases/auth_usecase.dart';
import 'package:rockettest/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;

  final LogoutUseCase logoutUseCase;
  final AuthRepository repository;

  AuthBloc({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.logoutUseCase,
    required this.repository,
  }) : super(const AuthState()) {
    on<AuthStarted>(_onStarted);
    on<SignInRequestedEvent>(_onSignInRequested);
    on<SignUpRequestedEvent>(_onSignUpRequested);
    on<SignOutRequestedEvent>(_onLogoutRequested);
  }

  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 300));
    final hasToken = await repository.hasToken();

    emit(state.copyWith(isAuthenticated: hasToken, isLoading: false));
  }

  Future<void> _onSignInRequested(
    SignInRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      await signInUseCase(event.email, event.password);
      emit(state.copyWith(isLoading: false, isAuthenticated: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      await signUpUseCase(event.email, event.password);
      emit(state.copyWith(isLoading: false, isAuthenticated: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    SignOutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await logoutUseCase();
    emit(const AuthState());
  }
}
