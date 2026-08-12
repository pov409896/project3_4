import 'package:project3_5/data/data_store.dart';

class ProductState {
  final List<DataStore> dataStore;
  ProductState({required this.dataStore});
  //create new object ProductState
  factory ProductState.init() {
    return ProductState(dataStore: []);
  }

  List<String> get categories {
    return dataStore.map((item) => item.category).toSet().toList();
  }
}
