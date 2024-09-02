import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<String> {
  AddressCubit() : super("Jl. ABC No. 123, Serpong, Tangerang");

  void selectedAddress(String newAddress) {
    emit(newAddress);
  }
}
