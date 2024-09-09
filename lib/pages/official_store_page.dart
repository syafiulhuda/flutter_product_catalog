// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/category_list/category_list_bloc.dart';
import 'package:flutter_consume_api/bloc/get_product_by_category/get_product_by_category_bloc.dart';
import 'package:flutter_consume_api/bloc/get_single_product/get_single_product_bloc.dart';
import 'package:flutter_consume_api/views/details/detail_product_from_categorical.dart';
import 'package:flutter_consume_api/widgets/search_bar_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class OfficialStorePage extends StatelessWidget {
  const OfficialStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ! MediaQuery
    final screenHorizontal = MediaQuery.of(context).size.width;
    final screenVertical = MediaQuery.of(context).size.height;

    // ! Bloc
    GetSingleProductBloc getSingleProductBlocByName =
        context.read<GetSingleProductBloc>();
    CategoryListBloc categoryListBloc = context.read<CategoryListBloc>();
    GetProductByCategoryBloc getProductByCategoryBloc =
        context.read<GetProductByCategoryBloc>();

    // ! Dijalankan pertama kali
    // ! Jalankan event FetchUser setelah frame pertama dirender
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (categoryListBloc.state is CategoryListInitial) {
        categoryListBloc.add(
          FetchCategory(),
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (getProductByCategoryBloc.state is GetProductByCategoryInitial) {
        getProductByCategoryBloc.add(
          const FetchProductByCategory(productByCategory: "beauty"),
        );
      }
    });

    // ! Search Bar controler
    TextEditingController searchBarControler = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        // ? Search Bar
        title: SeacrBarWidget(
          screenVertical: screenVertical,
          screenHorizontal: screenHorizontal,
          searchBarControler: searchBarControler,
          trailing: [
            BlocConsumer<GetSingleProductBloc, GetSingleProductState>(
              listener: (context, state) {
                if (state is GetSingleProductError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                } else if (state is GetSingleProductSuccess) {
                  // ? Mengosongkan searchBarControler setelah pencarian berhasil
                  // ? Lalu arahka ke halaman searchSingleProductByName
                  Navigator.pushNamed(
                    context,
                    "/searchSingleProductByName",
                    arguments: state.singleProduct,
                  ).then((_) {
                    // Tutup keyboard setelah kembali
                    FocusScope.of(context).unfocus();

                    // Kosongkan teks di search bar
                    searchBarControler.clear();
                  });
                }
              },
              listenWhen: (previous, current) {
                return current is GetSingleProductError ||
                    current is GetSingleProductSuccess;
              },
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    getSingleProductBlocByName.add(
                      FetchSingleProductByName(
                        title: searchBarControler.text,
                      ),
                    );
                  },
                  icon: const Icon(Icons.search),
                );
              },
            ),
          ],
          onSubmit: () {
            getSingleProductBlocByName.add(
              FetchSingleProductByName(
                title: searchBarControler.text,
              ),
            );
          },
          onTapOut: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.envelopeOpenText, size: 30)),
          const SizedBox(width: 10),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/keranjang");
              },
              icon: const FaIcon(FontAwesomeIcons.cartShopping, size: 30)),
          const SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0, // Posisi tepat di bawah AppBar
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenVertical * 0.05,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/category");
                    },
                    icon: const FaIcon(FontAwesomeIcons.bars),
                  ),
                  Expanded(
                    child: BlocConsumer<CategoryListBloc, CategoryListState>(
                      listener: (context, state) {
                        if (state is CategoryListSuccess) {
                          // buat agar text yang di klik berwarna hijau
                        }
                      },
                      builder: (context, state) {
                        if (state is CategoryListLoading) {
                          return Container();
                        } else if (state is CategoryListSuccess) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.category.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  getProductByCategoryBloc.add(
                                    FetchProductByCategory(
                                      productByCategory: state.category[index],
                                    ),
                                  );
                                },
                                child: Card(
                                  color: Colors.grey.shade100,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  // ! Menggunakan IntrinsicWidth
                                  // ! agar ukuran item tetap sama (tidak statis)
                                  child: IntrinsicWidth(
                                    stepHeight: screenVertical * 0.05,
                                    stepWidth: screenHorizontal * 0.15,
                                    child: Center(
                                      child: Text(
                                        toBeginningOfSentenceCase(
                                          state.category[index],
                                        ),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (state is CategoryListError) {
                          return Text(state.message);
                        }

                        return const Center(
                            child: Text('No categories available.'));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenVertical * 0.06, // Posisi di bawah tab bar
            left: 0,
            right: 0,
            bottom: 0,
            child: BlocBuilder<GetProductByCategoryBloc,
                GetProductByCategoryState>(
              builder: (context, state) {
                if (state is GetProductByCategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetProductByCategorySuccess) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: state.products.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products.products[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailProductFromCategorical(
                                      product: product),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    product.thumbnail,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  product.title,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text("${product.price} USD"),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                        Text("${product.rating}"),
                                      ],
                                    ),
                                    Text("${product.discountPercentage}% off!"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is GetProductByCategoryError) {
                  return Text(state.message);
                }
                return const Center(child: Text('No products available.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
