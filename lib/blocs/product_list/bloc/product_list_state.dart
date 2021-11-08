part of 'product_list_bloc.dart';

@immutable
abstract class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductInCart extends ProductListState{}
class ProductOutCart extends ProductListState{}