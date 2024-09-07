part of 'get_all_cart_bloc.dart';

sealed class GetAllCartEvent extends Equatable {
  const GetAllCartEvent();

  @override
  List<Object> get props => [];
}

class FetchAllCart extends GetAllCartEvent {
  final Cart cart;

  const FetchAllCart({required this.cart});

  @override
  List<Object> get props => [cart];
}
