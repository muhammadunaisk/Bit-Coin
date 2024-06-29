import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Card(
        child: ListTile(
          leading: Text("Abcde"),
        ),
      ),
    );
  }
}