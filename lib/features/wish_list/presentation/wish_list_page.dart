import 'package:ecart_app/features/wish_list/bloc/wish_list_bloc.dart';
import 'package:ecart_app/features/wish_list/presentation/wish_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  WishListBloc wishListBloc = WishListBloc();
  @override
  void initState() {
    wishListBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WishList'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocConsumer<WishListBloc, WishListState>(
          bloc: wishListBloc,
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
                          bloc: wishListBloc);
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
