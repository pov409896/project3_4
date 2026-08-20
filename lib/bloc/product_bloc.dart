import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project3_5/bloc/product_event.dart';
import 'package:project3_5/bloc/product_state.dart';
import 'package:project3_5/data/data_store.dart';
import 'package:project3_5/model/cart_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final dataStore = DataStore();
  ProductBloc() : super(ProductState.init()) {
    on<LoadProudctEvent>((event, emit) {
      onLoadingProduct(event, emit);
    });
    on<DetailProductEvent>((event, emit) {
      onDetailProduct(event, emit);
    });
    on<IncrementEvent>((event, emit) {
      onIncrement(event, emit);
    });
    on<DescrementEvent>((event, emit) {
      onDescrement(event, emit);
    });
    on<AddCartEvent>((event, emit) {
      onAddCart(event, emit);
    });
    on<RemoveCartEvent>((event, emit) {
      onRemove(event, emit);
    });
    on<UpdateQuantityEvent>((event, emit) {
      onUpdate(event, emit);
    });
    on<ResetQuantityEvent>((event, emit) {
      onReset(event, emit);
    });
  }
  void onLoadingProduct(LoadProudctEvent event, Emitter<ProductState> emit) {
    emit(state.copyItem(dataStore: dataStore.products));
  }

  void onReset(ResetQuantityEvent event, Emitter emit) {
    emit(state.copyItem(quantity: 1));
  }

  void onDetailProduct(DetailProductEvent event, Emitter emit) {
    emit(state.copyItem(deitalProduct: event.detialproduct));
  }

  void onIncrement(IncrementEvent event, Emitter emit) {
    emit(state.copyItem(quantity: state.quantity + 1));
  }

  void onDescrement(DescrementEvent event, Emitter emit) {
    int qty = 1;
    if (state.quantity > 1) {
      qty = state.quantity - 1;
    }
    emit(state.copyItem(quantity: qty));
  }

  void onRemove(RemoveCartEvent event, Emitter emit) {
    final remove = state.cartModel
        .where((item) => item.product.code != event.code)
        .toList();
    emit(state.copyItem(cartModel: remove));
  }

  void onUpdate(UpdateQuantityEvent event, Emitter emit) {
    
    final cartItem = state.cartModel.map((item) {
      if (item.product.code == event.cartModel.product.code &&
          item.size == event.cartModel.size &&
          item.color == event.cartModel.color) {
        return item.copyCart(quantity: event.quantity);
      }
      return item;
    }).toList();
    emit(state.copyItem(cartModel: cartItem));
  }

  void onAddCart(AddCartEvent event, Emitter emit) {
    final index = state.cartModel.indexWhere(
      (item) =>
          (item.product.code == event.product.code &&
          item.color == event.color &&
          item.size == event.size),
    );
    List<CartModel> cartItem = List.from(state.cartModel);
    if (index != -1) {
      final updatecart = cartItem[index];
      cartItem[index] = updatecart.copyCart(
        quantity: updatecart.quantity + event.quantity,
      );
    } else {
      cartItem.add(
        CartModel(
          product: event.product,
          color: event.color,
          quantity: event.quantity,
          size: event.size,
        ),
      );
    }
    emit(state.copyItem(cartModel: cartItem));
  }
}
