import 'package:ecart_app/features/HomePage/bloc/home_bloc.dart';
import 'package:ecart_app/features/cart/bloc/cart_bloc.dart';
import 'package:ecart_app/features/wish_list/bloc/wish_list_bloc.dart';
import 'package:ecart_app/features/wish_list/presentation/wish_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/HomePage/Presentation/HomePage.dart';
import 'features/cart/presentation/cart_page.dart';
import 'utils/bloc_observerable.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => HomeBloc()..add(InitialEvent()),
          ),
          BlocProvider(
            create: (_) => CartBloc()..add(CartInitialEvent()),
          ),
          BlocProvider(
            create: (_) => WishListBloc()..add(WishListInitialEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/cart': (context) => const CartPage(),
            '/wish-list': (context) => const WishListPage()
          },
        ));
  }
}
