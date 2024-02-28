part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeSuccessState extends HomeState {
  final ProductModel product;
  HomeSuccessState({required this.product});

  @override
  List<Object?> get props => [product];
}

class HomeActionState extends HomeState {
  @override
  List<Object?> get props => [];
}

class CartNavigationState extends HomeActionState {}

class WishListNavigationState extends HomeActionState {}

class CartAddedActionState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class WishListAddedActionState extends HomeActionState {
  @override
 
  List<Object?> get props => [];
}
