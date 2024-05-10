import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_bloc/models/products.dart';
import 'package:test_bloc/web/api_service.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial(pList: [])) {
    on<FetchProducts>((event, emit) async {
      final List<Products>? productsList = await ApiService().fetchData();
      emit(ProductsState(pList: productsList));
    });
  }
}
