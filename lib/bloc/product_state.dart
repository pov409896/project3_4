import 'package:project3_5/model/cart_model.dart';
import 'package:project3_5/model/product_model.dart';

class ProductState {
  final List<ProductModel> dataStore;
  final ProductModel? detailProduct;
  final List<CartModel> cartModel;
  final List<ProductModel>? filterProduct;
  final String category;
  int quantity;
  ProductState({
    required this.dataStore,
    this.detailProduct,
    this.quantity = 1,
    required this.cartModel,
    required this.category,
    this.filterProduct,
  });
  //create new object ProductState
  factory ProductState.init() {
    return ProductState(
      dataStore: [],
      detailProduct: null,
      quantity: 1,
      cartModel: [],
      filterProduct: [],
      category: "All",
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
    List<ProductModel>? filterProduct,
    String? category,
  }) {
    return ProductState(
      dataStore: dataStore ?? this.dataStore,
      detailProduct: deitalProduct ?? this.detailProduct,
      quantity: quantity ?? this.quantity,
      cartModel: cartModel ?? this.cartModel,
      filterProduct: filterProduct ?? this.filterProduct,
      category: category ?? this.category,
    );
  }

  // double get getotal => cartModel.fold(
  //   0.0,
  //   (sum, item) => sum += item.quantity * item.product.price,
  // );

  double getotal() {
    double total = 0.0;
    for (CartModel item in cartModel) {
      total += item.quantity * item.product.price;
    }
    return total;
  }

  double getDiscount() {
    double discount = (getotal() > 20 && getotal() <= 40)
        ? 5.5
        : (getotal() > 40 && getotal() <= 70)
        ? 6.5
        : (getotal() > 70 && getotal() <= 100)
        ? 7.0
        : 8.0;
    return getotal() * discount / 100;
  }

  double subtotal() {
    return getotal() - getDiscount() + 1;
  }
}
