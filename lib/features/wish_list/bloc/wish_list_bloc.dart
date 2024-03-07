import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecart_app/data/wish_item.dart';
import 'package:ecart_app/domain/product_model.dart';
import 'package:equatable/equatable.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListRemoveEvent>(wishListRemoveEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishListState> emit) {
    emit(WishListSuccessState(wishListItem: wishList));
  }

  FutureOr<void> wishListRemoveEvent(
      WishListRemoveEvent event, Emitter<WishListState> emit) {
    wishList.remove(event.product);
    emit(WishListRemoveState());
    emit(WishListSuccessState(wishListItem: wishList));
  }
}
