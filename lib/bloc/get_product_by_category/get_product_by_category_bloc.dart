import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_consume_api/models/products_model.dart';

import 'package:http/http.dart' as http;

part 'get_product_by_category_event.dart';
part 'get_product_by_category_state.dart';

class GetProductByCategoryBloc
    extends Bloc<GetProductByCategoryEvent, GetProductByCategoryState> {
  GetProductByCategoryBloc() : super(GetProductByCategoryInitial()) {
    on<FetchProductByCategory>(_fetchProductByCategory);
  }

  void _fetchProductByCategory(FetchProductByCategory event,
      Emitter<GetProductByCategoryState> emit) async {
    try {
      emit(GetProductByCategoryLoading());

      Uri url = Uri.parse(
          "https://dummyjson.com/products/category/${event.productByCategory}");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        Products product = Products.fromMap(data);

        emit(GetProductByCategorySuccess(products: product));
      }
    } catch (e) {
      emit(GetProductByCategoryError(message: "Error: $e"));
    }
  }
}
