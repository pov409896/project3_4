import 'package:flutter/material.dart';
import 'package:project3_5/util/app_text.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppText(text: "Favorite Screen")),
    );
  }
}