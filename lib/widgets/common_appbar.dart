import 'package:flutter/material.dart';

AppBar commonAppbar({String title = 'INSABELLE'}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      '$title',
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.shopping_cart,
        ),
      ),
    ],
  );
}
