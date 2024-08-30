part of 'get_single_product_bloc.dart';

sealed class GetSingleProductEvent extends Equatable {
  const GetSingleProductEvent();

  @override
  List<Object> get props => [];
}

class FetchSingleProduct extends GetSingleProductEvent {
  final SingleProduct userId;

  const FetchSingleProduct({required this.userId});

  @override
  List<Object> get props => [userId];
}
