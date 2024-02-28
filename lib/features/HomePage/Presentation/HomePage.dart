import 'package:ecart_app/features/HomePage/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/presentation/cart_page.dart';
import 'product_card.dart';
import '../../wish_list/presentation/wish_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            case HomeSuccessState:
              final product = state as HomeSuccessState;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  title: const Text("eCartApp"),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(WishListNavigationEvent());
                        },
                        icon: const Icon(Icons.favorite_rounded)),
                    IconButton(
                        onPressed: () {
                          
                          homeBloc.add(CartNavigationEvent());
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
                          homeBloc: homeBloc);
                    }),
              );
            default:
          }
          return Container();
        },
        buildWhen: (previous, current) => current is! HomeActionState,
        listenWhen: (previous, current) => current is HomeActionState,
        listener: (context, state) {
          if (state is CartNavigationState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
          } else if (state is WishListNavigationState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WishListPage()));
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
  