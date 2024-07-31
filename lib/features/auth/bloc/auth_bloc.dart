import 'package:bloc/bloc.dart';
import 'package:fastfood_ordering_system/features/auth/data/auth_repository.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthRegisterStarted>(_onAuthRegisterStarted);
    on<AuthLoginStarted>(_onAuthLoginStarted);
  }

  final AuthRepository _authRepository ;
  void _onAuthRegisterStarted(AuthRegisterStarted event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));

  }

  void _onAuthLoginStarted(AuthLoginStarted event, Emitter<AuthState> emit) async{
    emit(state.copyWith(status: AuthStatus.loading));
    final isLogin=await _authRepository.login(phoneNumber: event.phoneNumber, password: event.password);
    if(isLogin){
      emit(state.copyWith(status: AuthStatus.success));
    }
    else{
      emit(state.copyWith(status: AuthStatus.failed));
    }
  }
}
