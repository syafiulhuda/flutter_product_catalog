import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_consume_api/models/products.dart';

import 'package:http/http.dart' as http;

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsBloc() : super(GetAllProductsInitial()) {
    on<FetchAllProducts>(_fetchAllProducts);
  }

  void _fetchAllProducts(
      FetchAllProducts event, Emitter<GetAllProductsState> emit) async {
    try {
      emit(GetAllProductsLoading());

      Uri url = Uri.parse("https://dummyjson.com/products");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        Products products = Products.fromMap(data);

        emit(GetAllProductsSuccess(products: products));
      } else {
        emit(const GetAllProductsError(message: "Failed to Get All Products"));
      }
    } catch (e) {
      emit(GetAllProductsError(message: "Error: $e"));
    }
  }
}
