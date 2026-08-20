import 'package:flutter/material.dart';
import 'package:project3_5/cart/cart_screen.dart';
import 'package:project3_5/favorite/favorite_screen.dart';
import 'package:project3_5/home/home_screen.dart';
import 'package:project3_5/home/product_cart.dart';
import 'package:project3_5/profile/profile_screen.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final List page = [
    HomeScreen(),
    FavoriteScreen(),
    ProductCart(check:  false,),
    ProfileScreen(),
  ];
  int currendPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currendPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currendPage,
        onTap: (value) {
          setState(() {
            currendPage = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
