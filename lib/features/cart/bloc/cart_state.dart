part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<Product> cartList;
  const CartSuccessState({required this.cartList});
}

class CartRemoveState extends CartActionState {
  
}
