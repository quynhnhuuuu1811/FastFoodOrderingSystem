import 'package:bloc/bloc.dart';
import 'package:fastfood_ordering_system/features/auth/data/auth_repository.dart';

import '../../result_type.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthStarted>(_onStarted);
    on<AuthRegisterStarted>(_onAuthRegisterStarted);
    on<AuthLoginStarted>(_onAuthLoginStarted);
    on<AuthLogout>(_onAuthLogout);
  }

  final AuthRepository _authRepository ;
  void _onAuthRegisterStarted(AuthRegisterStarted event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result=await _authRepository.register(phoneNumber: event.phoneNumber, password: event.password, name: event.name);
    return (
        switch(result){
      Success() => emit(state.copyWith(status: AuthStatus.success)),
      Failed() => emit(state.copyWith(status: AuthStatus.failed,errorMsg: result.message))
    });

  }
  void _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.initial));
  }
  void _onAuthLoginStarted(AuthLoginStarted event, Emitter<AuthState> emit) async{
    emit(state.copyWith(status: AuthStatus.loading));
    final result=await _authRepository.login(phoneNumber: event.phoneNumber, password: event.password);

    return (
        switch(result){
      Success() => emit(state.copyWith(status: AuthStatus.success)),
      Failed() => emit(state.copyWith(status: AuthStatus.failed, errorMsg: result.message))
    });
  }

  void _onAuthLogout(AuthLogout event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result=await _authRepository.logout();
    return (
        switch(result){
      Success() => emit(AuthLogoutSuccess()),
      Failed() => emit(state.copyWith(status: AuthStatus.failed, errorMsg: result.message))
    });
  }
}
