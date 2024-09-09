// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_consume_api/models/cart.dart';

import 'package:http/http.dart' as http;

part 'get_all_cart_event.dart';
part 'get_all_cart_state.dart';

class GetAllCartBloc extends Bloc<GetAllCartEvent, GetAllCartState> {
  GetAllCartBloc() : super(GetAllCartInitial()) {
    on<FetchAllCart>(_fetchAllCart);
  }

  void _fetchAllCart(FetchAllCart event, Emitter<GetAllCartState> emit) async {
    try {
      emit(GetAllCartLoading());

      Uri url = Uri.parse("https://dummyjson.com/carts/");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        Cart cart = Cart.fromMap(data);

        emit(GetAllCartSuccess(getAllCartModel: cart));
        print((cart));
      } else {
        emit(const GetAllCartError(message: "Failed to Get All Carts"));
      }
    } catch (e) {
      emit(GetAllCartError(message: "Error: $e"));
    }
  }
}
