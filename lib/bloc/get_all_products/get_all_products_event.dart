part of 'get_all_products_bloc.dart';

sealed class GetAllProductsEvent extends Equatable {
  const GetAllProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchAllProducts extends GetAllProductsEvent {
  final Products fetchAllProducts;

  const FetchAllProducts({required this.fetchAllProducts});

  @override
  List<Object> get props => [fetchAllProducts];
}
