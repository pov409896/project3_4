
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project3_5/bloc/product_event.dart';
import 'package:project3_5/bloc/product_state.dart';
import 'package:project3_5/data/data_store.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final dataStore = DataStore();
  ProductBloc() : super(ProductState.init()) {
    on<LoadProudctEvent>((event, emit) {
      onLoadingProduct(event, emit);
    });
    on<DetailProductEvent>((event,emit){
      onDetailProduct(event,emit);
    });
  }
  void onLoadingProduct(LoadProudctEvent event, Emitter<ProductState> emit) {
    emit(state.copyItem(dataStore: dataStore.products));
  }
  void onDetailProduct(DetailProductEvent event,Emitter emit){
    emit(state.copyItem(deitalProduct: event.detialproduct));
  }
}
