import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_creonit/models/product.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc(Product product) : super(ProductListInitial()) {
    on<AddProductToCart>((event, emit) {
      emit(ProductInCart());
    });
    on<RemoveProductFromCart>((event, emit) {
      emit(ProductOutCart());
    });
  }
}
