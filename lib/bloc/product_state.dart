import 'package:project3_5/model/cart_model.dart';
import 'package:project3_5/model/product_model.dart';

class ProductState {
  final List<ProductModel> dataStore;
  final ProductModel? detailProduct;
  final List<CartModel> cartModel;
  int quantity;
  ProductState({
    required this.dataStore,
    this.detailProduct,
    this.quantity = 1,
    required this.cartModel,
  });
  //create new object ProductState
  factory ProductState.init() {
    return ProductState(
      dataStore: [],
      detailProduct: null,
      quantity: 1,
      cartModel: [],
    );
  }
  List<String> get categories {
    final add = dataStore.map((item) => item.category).toSet().toList();
    return ["All", ...add];
  }

  ProductState copyItem({
    List<ProductModel>? dataStore,
    ProductModel? deitalProduct,
    int? quantity,
    List<CartModel>? cartModel,
  }) {
    return ProductState(
      dataStore: dataStore ?? this.dataStore,
      detailProduct: deitalProduct ?? this.detailProduct,
      quantity: quantity ?? this.quantity,
      cartModel: cartModel ?? this.cartModel,
    );
  }
}
