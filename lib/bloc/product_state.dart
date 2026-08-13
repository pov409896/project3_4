import 'package:project3_5/model/product_model.dart';

class ProductState {
  final List<ProductModel> dataStore;
  ProductState({required this.dataStore});
  //create new object ProductState
  factory ProductState.init() {
    return ProductState(dataStore: []);
  }
  List<String> get categories {
    final add = dataStore.map((item) => item.category).toSet().toList();
    return ["All", ...add];
  }

  ProductState copyItem({List<ProductModel>? dataStore}) {
    return ProductState(dataStore: dataStore ?? this.dataStore);
  }
}
