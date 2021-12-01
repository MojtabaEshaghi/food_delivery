import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/screens/cart_screen.dart';

AppBar BuildAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.account_circle),
      iconSize: 30.0,
      onPressed: () {},
    ),
    centerTitle: true,
    title: const Text("Food Delivery"),
    actions: [
      TextButton(
        onPressed: ()=>Navigator.push(context,
        MaterialPageRoute(builder: (_)=>CartScreen())
        ),
        child: Text(
          "Cart (${currentUser.cart.length})",
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      )
    ],
  );
}
