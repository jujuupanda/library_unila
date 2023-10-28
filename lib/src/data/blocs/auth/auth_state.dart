part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class SignInSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}

class SignInErrorState extends AuthState {
  late String errorMessageSignIn;

  SignInErrorState(this.errorMessageSignIn);

  @override
  List<Object> get props => [errorMessageSignIn];
}

class SignOutSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}

class SignOutErrorState extends AuthState {
  @override
  List<Object> get props => [];
}

class IsAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}
