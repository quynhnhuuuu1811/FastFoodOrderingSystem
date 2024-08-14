import 'package:bloc/bloc.dart';
import 'package:fastfood_ordering_system/features/cart/data/cart_repository.dart';
import 'package:meta/meta.dart';

part 'count_controller_event.dart';
part 'count_controller_state.dart';

class CountControllerBloc extends Bloc<CountControllerEvent, CountControllerState> {
  CountControllerBloc(this._cartRepository) : super(CountControllerState(quantityMap: {})) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
    on<Reset>(_onReset);
    on<SetQuantity>(_onSetQuantity);
    on<IncrementUpdateQuantityCart>(_onIncrementUpdateQuantityCart);
    on<DecrementUpdateQuantityCart>(_onDecrementUpdateQuantityCart);
  }
  final CartRepository _cartRepository ;
  void _onIncrement(Increment event, Emitter<CountControllerState> emit) {
    // You need to provide a way to know which food ID is being incremented
    // Assuming we pass the foodId as a parameter from CartItem widget
    final foodId = event.foodId; // This requires foodId in Increment event
    final currentQuantity = state.quantityMap[foodId] ?? 1;
    emit(state.copyWith(
      quantityMap: {
        ...state.quantityMap,
        foodId: currentQuantity + 1,
      },
    ));
  }

  void _onDecrement(Decrement event, Emitter<CountControllerState> emit) {
    final foodId = event.foodId; // This requires foodId in Decrement event
    final currentQuantity = state.quantityMap[foodId] ?? 1;
    if (currentQuantity > 1) {
      emit(state.copyWith(
        quantityMap: {
          ...state.quantityMap,
          foodId: currentQuantity - 1,
        },
      ));
    }
  }

  void _onReset(Reset event, Emitter<CountControllerState> emit) {
    // You might need to reset quantity for specific foodId
    emit(state.copyWith(quantityMap: {}));
  }

  void _onSetQuantity(SetQuantity event, Emitter<CountControllerState> emit) {
    emit(state.copyWith(
      quantityMap: {
        ...state.quantityMap,
        event.foodId: event.quantity,
      },
    ));
  }

  void _onIncrementUpdateQuantityCart(IncrementUpdateQuantityCart event, Emitter<CountControllerState> emit) {
    final foodId = event.foodId;
    final userId = event.userId;
    final currentQuantity = state.quantityMap[foodId] ?? 1;
    emit(state.copyWith(
      quantityMap: {
        ...state.quantityMap,
        foodId: currentQuantity + 1,
      },
    ));
    _cartRepository.updateCart(userId, currentQuantity + 1,foodId);
  }

  void _onDecrementUpdateQuantityCart(DecrementUpdateQuantityCart event, Emitter<CountControllerState> emit) {
    final foodId = event.foodId;
    final userId = event.userId;
    final currentQuantity = state.quantityMap[foodId] ?? 1;
    if (currentQuantity > 1) {
      emit(state.copyWith(
        quantityMap: {
          ...state.quantityMap,
          foodId: currentQuantity - 1,
        },
      ));
      _cartRepository.updateCart(userId, currentQuantity - 1,foodId);
    }
  }
}
