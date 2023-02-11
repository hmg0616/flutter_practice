import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_detail.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_header.dart';
import 'package:flutter_shoppingcart/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildShoppingCartAppBar(),
      body: Column(
        children: [
          ShoppingCartHeader(),
          Expanded(child: ShoppingCartDetail()),
        ],
      ),
    );
  }

  AppBar _buildShoppingCartAppBar() => AppBar(
    elevation: 0.0, // 앱바 그림자
    leading: IconButton(
      icon:Icon(Icons.arrow_back),
      onPressed: () {
        print("클릭됨");
      },
    ),
    actions: [
      IconButton(
        onPressed: (){
          print("클릭됨");
        },
        icon: Icon(Icons.shopping_cart)
      ),
      SizedBox(width: 16.0,)
    ],
  );
}
