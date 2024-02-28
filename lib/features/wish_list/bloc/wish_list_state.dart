part of 'wish_list_bloc.dart';

abstract class WishListState extends Equatable {
  const WishListState();

  @override
  List<Object> get props => [];
}

abstract class WishListActionState extends WishListState {}

class WishListInitial extends WishListState {}

class WishListSuccessState extends WishListState {
  final List<Product> wishListItem;
  const WishListSuccessState({required this.wishListItem});
}
