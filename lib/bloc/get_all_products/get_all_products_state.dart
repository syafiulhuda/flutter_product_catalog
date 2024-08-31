part of 'get_all_products_bloc.dart';

sealed class GetAllProductsState extends Equatable {
  const GetAllProductsState();

  @override
  List<Object> get props => [];
}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsLoading extends GetAllProductsState {}

final class GetAllProductsSuccess extends GetAllProductsState {
  final Products products;

  const GetAllProductsSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class GetAllProductsError extends GetAllProductsState {
  final String message;

  const GetAllProductsError({required this.message});

  @override
  List<Object> get props => [message];
}
