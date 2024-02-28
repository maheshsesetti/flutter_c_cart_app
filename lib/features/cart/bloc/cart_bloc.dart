import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecart_app/data/cart_item.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveEvent>(cartRemoveEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartList: cartItems));
  }

  FutureOr<void> cartRemoveEvent(
      CartRemoveEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.product);
    emit(CartSuccessState(cartList: cartItems));
  }
}
