part of 'home_bloc.dart';

abstract class HomeEvent {}

class InitialEvent extends HomeEvent {}

class NavigationEvent extends HomeEvent {}

class CartInProductEvent extends HomeEvent {
  final Product cartProduct;
  CartInProductEvent({required this.cartProduct});
}

class WishListInProductEvent extends HomeEvent {
  final Product wishListProduct;
  WishListInProductEvent({required this.wishListProduct});
}

class CartNavigationEvent extends NavigationEvent {}

class WishListNavigationEvent extends NavigationEvent {}
