import 'package:bloc/bloc.dart';
import 'package:fastfood_ordering_system/features/cart/dtos/cart_success_dto.dart';
import 'package:meta/meta.dart';

import '../data/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this.cartRepository) : super(CartInitial()) {
    on<AddFoodToCart> (_onAddFoodToCart);
    on<GetCart> (_onGetCart);
  }
  final CartRepository cartRepository;

  void _onAddFoodToCart(AddFoodToCart event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    try {
      final message = await cartRepository.addFoodToCart(event.userId, event.foodId, event.quantity);
      emit(state.copyWith(status: CartStatus.success, message: message));
    } catch (e) {
      emit(state.copyWith(status: CartStatus.failure, message: e.toString()));
    }
  }

  void _onGetCart(GetCart event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    try {
      final cart = await cartRepository.getCart(event.userId);
      emit(state.copyWith(status: CartStatus.success, cartSuccessDto: cart));
    } catch (e) {
      emit(state.copyWith(status: CartStatus.failure, message: e.toString()));
    }
  }
}
