import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screen/cart/view/cart_screen.dart';
import 'package:shopping_app/screen/detail/view/detail_screen.dart';
import 'package:shopping_app/screen/home/provider/home_provider.dart';
import 'package:shopping_app/screen/home/view/home_screen.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomePage(),
          'detail':(context) => DetailScreen(),
          'cart':(context) => CartScreen(),
        },
      ),
    ),
  );
}