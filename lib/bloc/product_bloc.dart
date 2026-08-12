


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project3_5/bloc/product_event.dart';
import 'package:project3_5/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState.init()) {
    on<LoadProudctEvent>;
  }
}
