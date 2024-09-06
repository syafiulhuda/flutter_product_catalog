part of 'get_product_by_category_bloc.dart';

sealed class GetProductByCategoryState extends Equatable {
  const GetProductByCategoryState();

  @override
  List<Object> get props => [];
}

final class GetProductByCategoryInitial extends GetProductByCategoryState {}

final class GetProductByCategoryLoading extends GetProductByCategoryState {}

final class GetProductByCategorySuccess extends GetProductByCategoryState {
  final Products products;

  const GetProductByCategorySuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class GetProductByCategoryError extends GetProductByCategoryState {
  final String message;

  const GetProductByCategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
