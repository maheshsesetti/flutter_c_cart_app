import 'package:ecart_app/features/HomePage/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
 
    return BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadingState) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          } else if (state is HomeSuccessState) {
            final product = state;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text("eCartApp"),
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(WishListNavigationEvent());
                      
                      },
                      icon: const Icon(Icons.favorite_rounded)),
                  IconButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(CartNavigationEvent());
                      },
                      icon: const Icon(Icons.shopping_basket_rounded))
                ],
              ),
              body: ListView.separated(
                  itemCount: product.product.products!.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                        product: product.product.products![index],
                        );
                  }),
            );
          }

          return Container(
            color: Colors.red,
          );
        },
        buildWhen: (previous, current) => current is! HomeActionState,
        listenWhen: (previous, current) => current is HomeActionState,
        listener: (context, state) {
          if (state is CartNavigationState) {
            Navigator.pushNamed(context, '/cart');
          } else if (state is WishListNavigationState) {
            Navigator.pushNamed(context, '/wish-list');
          } else if (state is CartAddedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Item Added in the Cart")));
          } else if (state is WishListAddedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Item Added in the Wishlist")));
          }
        });
  }
}
