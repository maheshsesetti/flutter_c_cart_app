import 'package:ecart_app/features/wish_list/bloc/wish_list_bloc.dart';
import 'package:ecart_app/features/wish_list/presentation/wish_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('WishList'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocConsumer<WishListBloc, WishListState>(
          buildWhen: (previous, current) => current is! WishListActionState,
          listenWhen: (previous, current) => current is WishListActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishListSuccessState:
                final successState = state as WishListSuccessState;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return WishListCart(
                          item: successState.wishListItem[index],
                          );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: successState.wishListItem.length);
      
              default:
            }
            return Container();
          }),
    );
  }
}
