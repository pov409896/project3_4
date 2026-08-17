import 'package:project3_5/model/product_model.dart';

class ProductState {
  final List<ProductModel> dataStore;
  final ProductModel? detailProduct;
  ProductState({required this.dataStore, this.detailProduct});
  //create new object ProductState
  factory ProductState.init() {
    return ProductState(dataStore: [], detailProduct: null);
  }
  List<String> get categories {
    final add = dataStore.map((item) => item.category).toSet().toList();
    return ["All", ...add];
  }

  ProductState copyItem({
    List<ProductModel>? dataStore,
    ProductModel? deitalProduct,
  }) {
    return ProductState(
      dataStore: dataStore ?? this.dataStore,
      detailProduct: deitalProduct ?? this.detailProduct,
    );
  }
}
