part of 'products_bloc.dart';

class ProductsState {
  List<Products>? pList;

  ProductsState({required this.pList});
}

final class ProductsInitial extends ProductsState {
  ProductsInitial({required super.pList});
}
