import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:flutter_consume_api/models/products_model.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';

class GetAllProductsView extends StatelessWidget {
  const GetAllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    GetAllProductsBloc getAllProductsBloc = context.read<GetAllProductsBloc>();

    // ! Dijalankan pertama kali
    // ! Jalankan event FetchUser setelah frame pertama dirender
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (getAllProductsBloc.state is GetAllProductsInitial) {
        getAllProductsBloc.add(
          FetchAllProducts(
            fetchAllProducts: Products(
              products: [],
              total: 0,
              skip: 0,
              limit: 10,
            ),
          ),
        );
      }
    });

    return Scaffold(
      appBar: const CustomAppBar(
        widget: Text("Get All Products View"),
      ),
      body: BlocConsumer<GetAllProductsBloc, GetAllProductsState>(
        listener: (context, state) {
          if (state is GetAllProductsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is GetAllProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllProductsSuccess) {
            return ListView.builder(
              itemCount: state.products.products.length,
              itemBuilder: (context, index) {
                // ! Get All Products pada tiap Index
                final product = state.products.products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/detailPerProduct",
                      // ! kirim index per product pada tiap item di List Tile
                      arguments: product,
                    );
                  },
                  child: ListTile(
                    title: Text(
                      product.title,
                    ),
                    subtitle: Text(
                      product.description,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text("\$${product.price.toStringAsFixed(2)}"),
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipOval(
                        child: Image.network(
                          product.thumbnail,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return const Center(
                              child: Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 50,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Click the button to get data"),
            );
          }
        },
      ),
    );
  }
}
