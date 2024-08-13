import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'count_controller_event.dart';
part 'count_controller_state.dart';

class CountControllerBloc extends Bloc<CountControllerEvent, CountControllerState> {
  CountControllerBloc() : super(CountControllerInitial()) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
    on<Reset>(_onReset);
  }

  void _onIncrement(Increment event, Emitter<CountControllerState> emit) {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  void _onDecrement(Decrement event, Emitter<CountControllerState> emit) {
    if(state.quantity-1 < 1){
      return;
    }
    emit(state.copyWith(quantity: state.quantity - 1));
  }

  void _onReset(Reset event, Emitter<CountControllerState> emit) {
    emit(state.copyWith(quantity: 1));
  }
}
