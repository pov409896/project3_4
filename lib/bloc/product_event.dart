import 'package:project3_5/model/product_model.dart';

abstract class ProductEvent {}

class LoadProudctEvent extends ProductEvent {}

class DetailProductEvent extends ProductEvent {
  final ProductModel detialproduct;
  DetailProductEvent({required this.detialproduct});
}
