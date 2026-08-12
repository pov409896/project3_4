import 'package:flutter/material.dart';
import 'package:project3_5/util/app_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppText(text: "Cart Screen"),),
    );
  }
}