import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  CategoryListBloc() : super(CategoryListInitial()) {
    on<FetchCategory>(_onFetchCategory);
  }

  void _onFetchCategory(
      FetchCategory event, Emitter<CategoryListState> emit) async {
    emit(CategoryListLoading());

    try {
      Uri url = Uri.parse("https://dummyjson.com/products/category-list");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        emit(CategoryListSuccess(category: List.from(data)));
      } else {
        emit(const CategoryListError(message: "Failed to Get Category List"));
      }
    } catch (e) {
      emit(CategoryListError(message: "Error: $e"));
    }
  }
}
