import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:flutter_consume_api/bloc/get_single_product/get_single_product_bloc.dart';
import 'package:flutter_consume_api/models/products.dart';
import 'package:flutter_consume_api/models/single_product.dart';
import 'package:flutter_consume_api/pages/home_page.dart';
import 'package:flutter_consume_api/pages/not_found.dart';
import 'package:flutter_consume_api/views/details/detail_per_product.dart';
import 'package:flutter_consume_api/views/details/search_single_product_by_name.dart';
import 'package:flutter_consume_api/views/get_all_products_view.dart';
import 'package:flutter_consume_api/views/get_single_product_view.dart';

class AppRoutes {
  // ! Inject BlocProvider
  GetSingleProductBloc getSingleProductBloc = GetSingleProductBloc();
  GetAllProductsBloc getAllProductsBloc = GetAllProductsBloc();

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
      case "/getAllProductView":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getAllProductsBloc,
            child: const GetAllProductsView(),
          ),
        );
      case "/detailPerProduct":
        final product = settings.arguments as Product;

        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getAllProductsBloc,
            child: DetailPerProduct(product: product),
          ),
        );
      case "/searchSingleProductByName":
        final productName = settings.arguments as SingleProduct;

        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getAllProductsBloc,
            child: SearchSingleProductByName(productName: productName),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
    }
  }
}
