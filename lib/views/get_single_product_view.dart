import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/get_single_product/get_single_product_bloc.dart';
import 'package:flutter_consume_api/models/single_product.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';

class GetSingleProductView extends StatelessWidget {
  const GetSingleProductView({super.key});

  @override
  Widget build(BuildContext context) {
    GetSingleProductBloc getSingleProductBloc =
        context.read<GetSingleProductBloc>();

    // ! Dijalankan pertama kali
    // ! Jalankan event FetchUser setelah frame pertama dirender
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (getSingleProductBloc.state is GetSingleProductInitial) {
        getSingleProductBloc.add(
          FetchSingleProduct(
            userId: SingleProduct(
              id: Random().nextInt(50) + 1,
            ),
          ),
        );
      }
    });

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar(
        widget: Text(
          "Get Single Product View",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer<GetSingleProductBloc, GetSingleProductState>(
        listener: (context, state) {
          if (state is GetSingleProductError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is GetSingleProductSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "${state.singleProduct.id} - ${state.singleProduct.title}"),
              ),
            );
          }
        },
        listenWhen: (previous, current) {
          return current is GetSingleProductSuccess ||
              current is GetSingleProductError;
        },
        builder: (context, state) {
          if (state is GetSingleProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetSingleProductSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                        ),
                        child: const Text(
                          "Tags:",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: ListView.builder(
                            itemCount: state.singleProduct.tags!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Scrollbar(
                                thumbVisibility: true,
                                child: Row(
                                  children: [
                                    Text(
                                      state.singleProduct.tags![index],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent,
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.6,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Diskon:",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${state.singleProduct.discountPercentage!}%",
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Rating",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${state.singleProduct.rating!}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        const Icon(Icons.star),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 108,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    state.singleProduct.thumbnail!),
                                onBackgroundImageError: (error, stackTrace) {
                                  const Icon(Icons.not_accessible_outlined,
                                      color: Colors.red);
                                },
                                radius: 100,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Scrollbar(
                                thumbVisibility: true,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.01,
                                    horizontal: screenWidth * 0.01,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: ListView(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Title:",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            state.singleProduct.title!,
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Price:",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${state.singleProduct.price!} USD",
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Category:",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            state.singleProduct.category!,
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Description:",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            state.singleProduct.description!,
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Stok :",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${state.singleProduct.stock!}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("Click Button Please!!"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getSingleProductBloc.add(
            FetchSingleProduct(
              userId: SingleProduct(
                id: Random().nextInt(50) + 1,
              ),
            ),
          );
        },
        child: const Icon(
          Icons.download,
          color: Colors.green,
        ),
      ),
    );
  }
}
