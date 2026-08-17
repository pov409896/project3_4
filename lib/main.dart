import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project3_5/bloc/product_bloc.dart';
import 'package:project3_5/bloc/product_event.dart';
import 'package:project3_5/main_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(LoadProudctEvent()),
      child: GetMaterialApp(home: MainHomePage()),
    );
  }
}
