import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/get_product_by_category/get_product_by_category_bloc.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';

class CategoricalProduct extends StatelessWidget {
  final String category;

  const CategoricalProduct({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    GetProductByCategoryBloc getProductByCategoryBloc =
        context.read<GetProductByCategoryBloc>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Memastikan kategori baru memicu pengambilan data
      getProductByCategoryBloc
          .add(FetchProductByCategory(productByCategory: category));
    });

    return Scaffold(
      appBar: CustomAppBar(centerTile: true, widget: Text(category)),
      body: BlocConsumer<GetProductByCategoryBloc, GetProductByCategoryState>(
        listener: (context, state) {
          if (state is GetProductByCategoryError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is GetProductByCategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetProductByCategorySuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
              ),
              itemCount: state.products.products.length,
              itemBuilder: (context, index) {
                final product = state.products.products[index];
                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          product.thumbnail,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text("Price: ${product.price}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is GetProductByCategoryError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No products available.'));
        },
      ),
    );
  }
}
