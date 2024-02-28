import 'package:ecart_app/features/wish_list/bloc/wish_list_bloc.dart';
import 'package:flutter/material.dart';

import '../../../domain/product_model.dart';

class WishListCart extends StatelessWidget {
  final Product item;
  final WishListBloc bloc;
  const WishListCart({super.key, required this.item, required this.bloc});

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
                    Icons.favorite_rounded,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    bloc.add(WishListRemoveEvent(product: item));
                  },
                  icon: const Icon(Icons.delete),
                )
              ]),
        )
      ]),
    );
  }
}
