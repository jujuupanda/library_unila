import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repositories/auth_repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitialState()) {
    on<OnInitialAuthEvent>(_OnInitialAuthEvent);
    on<OnSignInEvent>(_OnSignInEvent);
    on<OnSignOutEvent>(_OnSignOutEvent);
  }

  _OnInitialAuthEvent(OnInitialAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    if (token == null) {
      emit(UnAuthenticated());
    } else {
      emit(IsAuthenticated());
    }
  }

  Future<void> _setToken(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> _removeToken(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future _OnSignInEvent(OnSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await Future.delayed(const Duration(seconds: 1), () {
      repository.signInClass.signIn(event.npm, event.password);
    }).whenComplete(() {
      if (repository.signInClass.errorMessageSignIn == "") {
        _setToken("token", repository.signInClass.token);
        emit(SignInSuccessState());
      } else {
        emit(SignInErrorState(repository.signInClass.errorMessageSignIn));
      }
    });
  }

  Future _OnSignOutEvent(OnSignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await Future.delayed(const Duration(seconds: 1), () {
      _removeToken("token");
    }).whenComplete(() {
      emit(SignOutSuccessState());
    });

    // try {
    //   await repository.signOutClass.signOut();
    //   _removeToken("token");
    //   emit(AuthSignOutSuccessState());
    // } catch (e) {
    //   emit(AuthErrorState(errorMessageSignOut));
    // }
  }
}
