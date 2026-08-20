import 'package:project3_5/model/cart_model.dart';
import 'package:project3_5/model/product_model.dart';

abstract class ProductEvent {}

class LoadProudctEvent extends ProductEvent {}

class DetailProductEvent extends ProductEvent {
  final ProductModel detialproduct;
  DetailProductEvent({required this.detialproduct});
}

class IncrementEvent extends ProductEvent {}

class DescrementEvent extends ProductEvent {}

class AddCartEvent extends ProductEvent {
  final ProductModel product;
  final String size;
  final String color;
  final int quantity;
  AddCartEvent({
    required this.product,
    required this.color,
    required this.quantity,
    required this.size,
  });
}

class RemoveCartEvent extends ProductEvent {
  final int code;
  final CartModel removeCart;
  RemoveCartEvent({required this.removeCart, required this.code});
}

class UpdateQuantityEvent extends ProductEvent {
  final CartModel cartModel;
  final int quantity;
  UpdateQuantityEvent({required this.cartModel, required this.quantity});
}

class ResetQuantityEvent extends ProductEvent {}
