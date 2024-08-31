// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class FetchSingleProductByName extends GetSingleProductEvent {
  final String title;

  const FetchSingleProductByName({required this.title});

  @override
  List<Object> get props => [title];
}
