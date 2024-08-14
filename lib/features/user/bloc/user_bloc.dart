import 'package:bloc/bloc.dart';
import 'package:fastfood_ordering_system/features/user/data/user_repository.dart';
import '../dtos/user_dto.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._userRepository) : super(UserInitial()) {
    on<FetchUser>(_onFetchUser);
    on<UpdateUserInfor>(_onUpdateUserInfor);
    on<UpdatePassword>(_onUpdatePassword);
  }
  final UserRepository _userRepository ;
  void _onFetchUser(FetchUser event, Emitter<UserState> emit) async {
    emit(UserState(status: UserStatus.loading));
    try {
      final user = await _userRepository.fetchUser(event.id);

      emit(UserState(status: UserStatus.success, user: user));
    } catch (e) {
      emit(UserState(status: UserStatus.failure, message: e.toString()));
    }
  }

  void _onUpdateUserInfor(UpdateUserInfor event, Emitter<UserState> emit) async {
    emit(UserState(status: UserStatus.loading));
    try {
      final user = await _userRepository.updateUserInfor(event.id,event.name, event.phone);

      emit(UserState(status: UserStatus.success, user: user));
    } catch (e) {
      emit(UserState(status: UserStatus.failure, message: e.toString()));
    }
  }

  void _onUpdatePassword(UpdatePassword event, Emitter<UserState> emit) async {
    emit(UserState(status: UserStatus.loading));
    try {
      final user = await _userRepository.updatePassword(event.id,event.password,event.oldPass);
      emit(UserState(status: UserStatus.success, user: user));
    } catch (e) {
      final errorMessage = e.toString().replaceAll(RegExp(r'Exception: '), '');
      emit(UserState(status: UserStatus.failure, message: errorMessage));
    }
  }

}
