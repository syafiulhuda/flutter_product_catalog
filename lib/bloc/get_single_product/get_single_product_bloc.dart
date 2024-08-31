import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_consume_api/models/single_product.dart';

import 'package:http/http.dart' as http;

part 'get_single_product_event.dart';
part 'get_single_product_state.dart';

class GetSingleProductBloc
    extends Bloc<GetSingleProductEvent, GetSingleProductState> {
  GetSingleProductBloc() : super(GetSingleProductInitial()) {
    on<FetchSingleProduct>(_fetchSingleProduct);
    on<FetchSingleProductByName>(_fetchSingleProductByName);
  }

  void _fetchSingleProduct(
      FetchSingleProduct event, Emitter<GetSingleProductState> emit) async {
    emit(GetSingleProductLoading());

    try {
      Uri url = Uri.parse("https://dummyjson.com/products/${event.userId.id}");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        SingleProduct product = SingleProduct.fromMap(data);

        emit(GetSingleProductSuccess(singleProduct: product));
      }
    } catch (e) {
      emit(GetSingleProductError(message: "Error: $e"));
    }
  }

  void _fetchSingleProductByName(FetchSingleProductByName event,
      Emitter<GetSingleProductState> emit) async {
    emit(GetSingleProductLoading());

    try {
      Uri url = Uri.parse("https://dummyjson.com/products");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['products'];

        String? productId;
        for (var product in data) {
          if (product['title'].toLowerCase() == event.title.toLowerCase()) {
            productId = product['id'].toString();
            break;
          }
        }

        if (productId != null) {
          Uri productUrl =
              Uri.parse("https://dummyjson.com/products/$productId");
          var productResponse = await http.get(productUrl);

          if (productResponse.statusCode == 200) {
            Map<String, dynamic> data = json.decode(productResponse.body);

            SingleProduct product = SingleProduct.fromMap(data);
            emit(GetSingleProductSuccess(singleProduct: product));
          } else {
            emit(const GetSingleProductError(
                message: "Error fetching product details"));
          }
        } else {
          emit(const GetSingleProductError(message: "Product not found"));
        }
      } else {
        emit(const GetSingleProductError(message: "Error fetching products"));
      }
    } catch (e) {
      emit(GetSingleProductError(message: "Error: $e"));
    }
  }
}
