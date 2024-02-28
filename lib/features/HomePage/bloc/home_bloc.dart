import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecart_app/data/product.dart';
import 'package:ecart_app/domain/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/cart_item.dart';
import '../../../data/wish_item.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<InitialEvent>(homeInitialEvent);
    on<CartNavigationEvent>(cartNavigationEvent);
    on<WishListNavigationEvent>(wishListNavigationEvent);
    on<CartInProductEvent>(cartInProductEvent);
    on<WishListInProductEvent>(wishListInProductEvent);
  }

  FutureOr<void> homeInitialEvent(
      InitialEvent event, Emitter<HomeState> emit) async {
    debugPrint("Initial Event is Called");
    emit(HomeLoadingState());
    Future.delayed(const Duration(seconds: 5));
    emit(HomeSuccessState(product: ProductModel.fromJson(productJson)));
  }

  FutureOr<void> cartNavigationEvent(
      CartNavigationEvent event, Emitter<HomeState> emit) {
    debugPrint("Cart Event is Called");
    emit(CartNavigationState());
  }

  FutureOr<void> wishListNavigationEvent(
      WishListNavigationEvent event, Emitter<HomeState> emit) {
    debugPrint("wishList Event is Called");
    emit(WishListNavigationState());
  }

  FutureOr<void> cartInProductEvent(
      CartInProductEvent event, Emitter<HomeState> emit) {
    debugPrint("cartInProduct Clicked");
    cartItems.add(event.cartProduct);
    print(cartItems);
    emit(CartAddedActionState());
  }

  FutureOr<void> wishListInProductEvent(
      WishListInProductEvent event, Emitter<HomeState> emit) {
    debugPrint("wishListIn product Click");
    wishList.add(event.wishListProduct);
    print(wishList);
    emit(WishListAddedActionState());
  }
}
