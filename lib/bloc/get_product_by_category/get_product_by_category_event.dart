part of 'get_product_by_category_bloc.dart';

sealed class GetProductByCategoryEvent extends Equatable {
  const GetProductByCategoryEvent();

  @override
  List<Object> get props => [];
}

class FetchProductByCategory extends GetProductByCategoryEvent {
  final String productByCategory;

  const FetchProductByCategory({required this.productByCategory});

  @override
  List<Object> get props => [productByCategory];
}
