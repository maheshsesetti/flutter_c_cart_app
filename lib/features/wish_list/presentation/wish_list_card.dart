import 'package:ecart_app/features/wish_list/bloc/wish_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/product_model.dart';

class WishListCart extends StatelessWidget {
  final Product item;

  const WishListCart({super.key, required this.item});

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
                    context
                        .read<WishListBloc>()
                        .add(WishListRemoveEvent(product: item));
                  },
                  icon: const Icon(Icons.delete),
                )
              ]),
        )
      ]),
    );
  }
}
