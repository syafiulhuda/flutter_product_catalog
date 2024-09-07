part of 'get_all_cart_bloc.dart';

sealed class GetAllCartState extends Equatable {
  const GetAllCartState();

  @override
  List<Object> get props => [];
}

final class GetAllCartInitial extends GetAllCartState {}

final class GetAllCartLoading extends GetAllCartState {}

final class GetAllCartSuccess extends GetAllCartState {
  final Cart getAllCartModel;

  const GetAllCartSuccess({required this.getAllCartModel});

  @override
  List<Object> get props => [getAllCartModel];
}

final class GetAllCartError extends GetAllCartState {
  final String message;

  const GetAllCartError({required this.message});

  @override
  List<Object> get props => [message];
}
