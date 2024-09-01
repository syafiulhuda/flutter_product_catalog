import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/app.dart';
import 'package:flutter_consume_api/bloc/category_list/category_list_bloc.dart';
import 'package:flutter_consume_api/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:flutter_consume_api/bloc/get_single_product/get_single_product_bloc.dart';

// ! Handling CERTIFICATE_VERIFY_FAILED
class CertificateVerify extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = CertificateVerify();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetSingleProductBloc(),
        ),
        BlocProvider(
          create: (context) => GetAllProductsBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryListBloc(),
        ),
      ],
      child: App(),
    );
  }
}
