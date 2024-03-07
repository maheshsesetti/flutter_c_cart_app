import 'package:ecart_app/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocConsumer<CartBloc, CartState>(
          buildWhen: (previous, current) => current is! CartActionState,
          listenWhen: (previous, current) => current is CartActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState:
                final successState = state as CartSuccessState;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return CartCard(
                          item: successState.cartList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: successState.cartList.length);
      
              default:
            }
            return Container();
          },
          listener: (context, state) {
            if (state is CartRemoveState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Cart Remove")));
            }
          }),
    );
  }
}
