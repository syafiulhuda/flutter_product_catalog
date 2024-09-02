// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_consume_api/models/user_login.dart';

import 'package:http/http.dart' as http;

part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc() : super(UserLoginInitial()) {
    on<LoginUser>(_loginUser);
  }

  void _loginUser(LoginUser event, Emitter<UserLoginState> emit) async {
    emit(UserLoginLoading());

    try {
      Uri url = Uri.parse("https://dummyjson.com/user/login");

      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: event.userLogin.toJson(),
      );

      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200 ||
          data.containsKey('token') ||
          data['token'] != null) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");

        UserLogin loginData = UserLogin.fromMap(data);

        emit(UserLoginSuccess(userLogin: loginData));
      }
    } catch (e) {
      emit(UserLoginError(message: "Error: $e"));
    }
  }
}