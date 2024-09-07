// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/get_all_cart/get_all_cart_bloc.dart';
import 'package:flutter_consume_api/bloc/get_single_product/get_single_product_bloc.dart';
import 'package:flutter_consume_api/models/cart.dart';
import 'package:flutter_consume_api/routes/transaction_route.dart';
import 'package:flutter_consume_api/widgets/search_bar_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransaksiPage extends StatelessWidget {
  const TransaksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Routes
    List<Map<String, dynamic>> transactionRoute = TransactionRoute().settings;

    // ! MediaQuery
    final screenHorizontal = MediaQuery.of(context).size.width;
    final screenVertical = MediaQuery.of(context).size.height;

    // ! Bloc
    GetSingleProductBloc getSingleProductBlocByName =
        context.read<GetSingleProductBloc>();
    GetAllCartBloc getAllCartBloc = context.read<GetAllCartBloc>();

    // ! Dijalankan pertama kali
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (getAllCartBloc.state is GetAllCartInitial) {
        getAllCartBloc.add(
          FetchAllCart(
            cart: Cart(
              carts: [],
              total: 0,
              skip: 0,
              limit: 10,
            ),
          ),
        );
      }
    });

    // ! Search Bar controler
    TextEditingController searchBarControler = TextEditingController();

    return Scaffold(
      appBar: AppBar(
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
                  Navigator.pushNamed(
                    context,
                    "/searchSingleProductByName",
                    arguments: state.singleProduct,
                  ).then((_) {
                    FocusScope.of(context).unfocus();
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
        actions: const [
          FaIcon(FontAwesomeIcons.envelopeOpenText, size: 30),
          SizedBox(width: 10),
          FaIcon(FontAwesomeIcons.cartShopping, size: 30),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          // ListView pertama
          SizedBox(
            height: screenVertical * 0.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: transactionRoute.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: Colors.grey.shade100,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IntrinsicWidth(
                      stepHeight: screenVertical * 0.05,
                      stepWidth: screenHorizontal * 0.15,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${transactionRoute[index]["name"]}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            transactionRoute[index]["icon"],
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // ListView kedua
          Expanded(
            child: BlocConsumer<GetAllCartBloc, GetAllCartState>(
              listener: (context, state) {
                if (state is GetAllCartError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              listenWhen: (previous, current) {
                return current is GetAllCartError;
              },
              builder: (context, state) {
                if (state is GetAllCartLoading) {
                  return Center(
                    child: Container(),
                  );
                } else if (state is GetAllCartSuccess) {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenHorizontal * 0.02,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.grey.shade100,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ? Line 1
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      SizedBox(width: 10),
                                      FaIcon(
                                          FontAwesomeIcons.brandsFontAwesome),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Belanja",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text("6 Sep 2024")
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Card(
                                        shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        color: Colors.yellowAccent,
                                        child: const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            "Diproses",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Icon(Icons.more_vert),
                                    ],
                                  ),
                                ],
                              ),
                              // ? Line 2
                              const SizedBox(height: 10),
                              const Row(
                                children: [
                                  SizedBox(width: 5),
                                  CircleAvatar(
                                    radius: 25,
                                    child: Icon(
                                      Icons.smartphone,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Samsung Galaxy S24 5G 8/512GB - Black Amber",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text("1 barang"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // ? Line 3
                              const SizedBox(height: 10),
                              const Row(
                                children: [
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Total Belanja"),
                                      Text(
                                        "Rp. 5.092.180",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is GetAllCartError) {
                  return Center(
                    child: Container(),
                  );
                }

                return const Center(child: Text('No Transaction available.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
