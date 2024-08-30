part of 'get_single_product_bloc.dart';

sealed class GetSingleProductState extends Equatable {
  const GetSingleProductState();

  @override
  List<Object> get props => [];
}

final class GetSingleProductInitial extends GetSingleProductState {}

final class GetSingleProductLoading extends GetSingleProductState {}

final class GetSingleProductSuccess extends GetSingleProductState {
  final SingleProduct singleProduct;

  const GetSingleProductSuccess({required this.singleProduct});

  @override
  List<Object> get props => [singleProduct];
}

final class GetSingleProductError extends GetSingleProductState {
  final String message;

  const GetSingleProductError({required this.message});

  @override
  List<Object> get props => [message];
}
