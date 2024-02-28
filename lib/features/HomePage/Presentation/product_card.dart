import 'package:ecart_app/domain/product_model.dart';
import 'package:ecart_app/features/HomePage/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final HomeBloc homeBloc;
  final Product product;

  const ProductCard({super.key, required this.homeBloc, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Image.network(
          product.thumbnail ?? "",
          loadingBuilder: (context, child, loadingProgress) => child,
        ),
        ListTile(
          title: Text(product.title ?? ""),
          subtitle: Text("\$ ${product.price}"),
          trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    homeBloc
                        .add(WishListInProductEvent(wishListProduct: product));
                  },
                  icon: const Icon(Icons.favorite_border_rounded),
                ),
                IconButton(
                  onPressed: () {
                    homeBloc.add(CartInProductEvent(cartProduct: product));
                  },
                  icon: const Icon(Icons.shopping_basket_outlined),
                )
              ]),
        )
      ]),
    );
  }
}
