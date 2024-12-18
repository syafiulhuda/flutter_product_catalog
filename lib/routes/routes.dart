// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/category_list/category_list_bloc.dart';
import 'package:flutter_consume_api/bloc/get_all_cart/get_all_cart_bloc.dart';
import 'package:flutter_consume_api/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:flutter_consume_api/bloc/get_feed/get_feed_bloc.dart';
import 'package:flutter_consume_api/bloc/get_product_by_category/get_product_by_category_bloc.dart';
import 'package:flutter_consume_api/bloc/get_single_product/get_single_product_bloc.dart';
import 'package:flutter_consume_api/bloc/user_login/user_login_bloc.dart';
import 'package:flutter_consume_api/models/products_model.dart';
import 'package:flutter_consume_api/models/single_product.dart';
import 'package:flutter_consume_api/pages/feed_page.dart';
import 'package:flutter_consume_api/home.dart';
import 'package:flutter_consume_api/pages/home_page.dart';
import 'package:flutter_consume_api/pages/login_page.dart';
import 'package:flutter_consume_api/pages/not_found.dart';
import 'package:flutter_consume_api/pages/account_page.dart';
import 'package:flutter_consume_api/pages/official_store_page.dart';
import 'package:flutter_consume_api/pages/splash_screen.dart';
import 'package:flutter_consume_api/pages/transaksi_page.dart';
import 'package:flutter_consume_api/views/cart_shoping_view.dart';
import 'package:flutter_consume_api/views/category_view.dart';
import 'package:flutter_consume_api/views/details/account_detail.dart';
import 'package:flutter_consume_api/views/details/categorical_product.dart';
import 'package:flutter_consume_api/views/details/detail_per_product.dart';
import 'package:flutter_consume_api/views/details/pesan_detail.dart';
import 'package:flutter_consume_api/views/details/search_single_product_by_name.dart';
import 'package:flutter_consume_api/views/get_all_products_view.dart';
import 'package:flutter_consume_api/views/get_single_product_view.dart';
import 'package:flutter_consume_api/views/pesan_view.dart';

class AppRoutes {
  // ! Inject BlocProvider
  GetSingleProductBloc getSingleProductBloc = GetSingleProductBloc();
  GetAllProductsBloc getAllProductsBloc = GetAllProductsBloc();
  CategoryListBloc categoryListBloc = CategoryListBloc();
  GetProductByCategoryBloc getProductByCategoryBloc =
      GetProductByCategoryBloc();
  UserLoginBloc userLoginBloc = UserLoginBloc();
  GetAllCartBloc getAllCartBloc = GetAllCartBloc();
  GetFeedBloc getFeedBloc = GetFeedBloc();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: userLoginBloc,
            child: const LoginPage(),
          ),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case "/homepage":
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case "/feed":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getFeedBloc,
            child: FeedPage(),
          ),
        );
      case "/officialStore":
        return MaterialPageRoute(
          builder: (context) => const OfficialStorePage(),
        );
      case "/transaksi":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getAllCartBloc,
            child: const TransaksiPage(),
          ),
        );
      case "/account":
        return MaterialPageRoute(
          builder: (context) => const AccountPage(),
        );
      case "/accountDetail":
        return MaterialPageRoute(
          builder: (context) => const AccountDetail(),
        );

      case "/category":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: categoryListBloc,
            child: const CategoryView(),
          ),
        );
      case "/keranjang":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getAllCartBloc,
            child: const CartShopingView(),
          ),
        );
      case "/pesan":
        return MaterialPageRoute(
          builder: (context) => const PesanView(),
        );
      case "/chat":
        return MaterialPageRoute(
          builder: (context) => const PesanDetail(),
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
      case "/categoricalProduct":
        final productCategory = settings.arguments;
        print(
            "Navigating to CategoricalProduct with category: $productCategory");
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getProductByCategoryBloc,
            child: CategoricalProduct(
              category: productCategory as String,
            ),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
    }
  }
}
