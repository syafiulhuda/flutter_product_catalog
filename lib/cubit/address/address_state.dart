part of 'address_cubit.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class AddressInitial extends AddressState {
  final String address;

  const AddressInitial({required this.address});

  @override
  List<Object> get props => [address];
}
