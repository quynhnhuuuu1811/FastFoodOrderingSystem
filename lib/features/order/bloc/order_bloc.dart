import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../foods/dtos/food_dto.dart';
import '../data/order_repository.dart';
import '../dtos/order_dto.dart';
import '../dtos/order_success_dto.dart';
import '../dtos/select_Items_dto.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this._orderRepository) : super(OrderInitial()) {
    on<OrderCreate>(_onOrderCreate);
    on<UpdateSelectItems>(_onUpdateSelectItems);
    on<GetOrderByUserId>(_onGetOrderByUserId);
    on<GetBestSeller>(_onGetBestSeller);
    on<OrderReset>(_onOrderReset);
  }

  final OrderRepository _orderRepository ;

  void _onOrderCreate(OrderCreate event, Emitter<OrderState> emit) async {
    emit(state.copyWith(status: OrderStatus.loading));
    try {
      final message = await _orderRepository.createOrder(
        note: event.note,
        address: event.address,
        selectItems: event.selectItems,
        userId: event.userId,
      );
      emit(state.copyWith(status: OrderStatus.success, message: message));
    } catch (e) {
      emit(state.copyWith(status: OrderStatus.failure, message: e.toString()));
    }
  }

  void _onUpdateSelectItems(UpdateSelectItems event, Emitter<OrderState> emit) {
    emit(state.copyWith(selectItems: event.selectItems));
  }

  void _onGetOrderByUserId(GetOrderByUserId event, Emitter<OrderState> emit) async {
    emit(state.copyWith(status: OrderStatus.loading));
    try {
      final orders = await _orderRepository.getOrderByUserId(event.userId);
      emit(state.copyWith(status: OrderStatus.success, orders: orders));
    } catch (e) {
      emit(state.copyWith(status: OrderStatus.failure, message: e.toString()));
    }
  }

  void _onGetBestSeller(GetBestSeller event, Emitter<OrderState> emit) async {
    emit(state.copyWith(status: OrderStatus.loading));
    try {
      final bestSeller = await _orderRepository.getBestSeller();
      emit(state.copyWith(status: OrderStatus.success, bestSeller: bestSeller));
    } catch (e) {
      emit(state.copyWith(status: OrderStatus.failure, message: e.toString()));
    }
  }
  void _onOrderReset(OrderReset event, Emitter<OrderState> emit) {
    emit(OrderInitial());
  }
}
