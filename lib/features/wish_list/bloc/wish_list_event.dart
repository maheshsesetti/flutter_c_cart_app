part of 'wish_list_bloc.dart';

abstract class WishListEvent extends Equatable {
  const WishListEvent();

  @override
  List<Object> get props => [];
}

class WishListInitialEvent extends WishListEvent {}

class WishListRemoveEvent extends WishListEvent {
  final Product product;
  const WishListRemoveEvent({required this.product});
}
