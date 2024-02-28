import 'package:ecart_app/domain/product_model.dart';
import 'package:ecart_app/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  final Product item;
  final CartBloc bloc;
  const CartCard({super.key, required this.item, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Image.network(
          item.thumbnail ?? "",
          loadingBuilder: (context, child, loadingProgress) => child,
        ),
        ListTile(
          title: Text(item.title ?? ""),
          subtitle: Text("\$ ${item.price}"),
          trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_basket,
                    color: Colors.teal,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    bloc.add(CartRemoveEvent(product: item));
                  },
                  icon: const Icon(Icons.delete),
                ),
              ]),
        )
      ]),
    );
  }
}
