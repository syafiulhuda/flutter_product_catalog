import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/get_single_product/get_single_product_bloc.dart';
import 'package:flutter_consume_api/pages/home_page.dart';
import 'package:flutter_consume_api/pages/not_found.dart';
import 'package:flutter_consume_api/views/get_single_product_view.dart';

class AppRoutes {
  // ! Inject BlocProvider
  GetSingleProductBloc getSingleProductBloc = GetSingleProductBloc();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case "/getSingleProductView":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getSingleProductBloc,
            child: const GetSingleProductView(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
    }
  }
}
