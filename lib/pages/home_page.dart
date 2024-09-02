// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:flutter_consume_api/bloc/get_single_product/get_single_product_bloc.dart';
import 'package:flutter_consume_api/cubit/address/address_cubit.dart';
import 'package:flutter_consume_api/models/products.dart';
import 'package:flutter_consume_api/routes/gridview_route.dart';
import 'package:flutter_consume_api/widgets/bottom_nav_bar.dart';
import 'package:flutter_consume_api/widgets/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Routes
    List<Map<String, dynamic>> gridviewRoute = GridviewRoute().routes;

    // ! MediaQuery
    final screenHorizontal = MediaQuery.of(context).size.width;
    final screenVertical = MediaQuery.of(context).size.height;
    // ! AppBar
    double appBarHeight = AppBar().preferredSize.height;

    // ! Bloc
    GetSingleProductBloc getSingleProductBlocByName =
        context.read<GetSingleProductBloc>();
    GetAllProductsBloc getAllProductsBloc = context.read<GetAllProductsBloc>();

    // ! Search Bar controler
    TextEditingController searchBarControler = TextEditingController();

    // ! Addresses
    List<String> addresses = [
      "Jl. ABC No. 123, Serpong, Tangerang",
      "Jl. DEF No. 456, Rawamangun, Jakarta",
      "Jl. GHI No. 789, Ciwidey, Bandung",
      "Jl. JKL No. 012, Meksiko, Surabaya",
    ];

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
                  Navigator.pushNamed(
                    context,
                    "/searchSingleProductByName",
                    arguments: state.singleProduct,
                  );
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
        ),
        actions: const [
          Icon(Icons.message, size: 35),
          SizedBox(width: 10),
          Icon(Icons.notifications, size: 35),
          SizedBox(width: 10),
          Icon(Icons.menu, size: 35),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenVertical * 1.0,
          child: ListView(
            children: [
              // ? Alamat
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenHorizontal * 0.02,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.maps_home_work,
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BlocBuilder<AddressCubit, String>(
                        builder: (context, state) {
                          return DropdownButton<String>(
                            icon: const Icon(
                                Icons.arrow_drop_down_circle_outlined),
                            value: state,
                            isExpanded: true,
                            items: addresses.map((String address) {
                              return DropdownMenuItem<String>(
                                value: address,
                                child: Text(
                                  address,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              if (newValue != null) {
                                context
                                    .read<AddressCubit>()
                                    .selectedAddress(newValue);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // ? Saldo, Discount, Koin
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            "Saldo",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text("Rp. 0"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.discount,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            "Diskon 85%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Cuma 7rb/bln",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            "Silver",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text("24 Kupon Baru"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // ? Card Menu
              Container(
                height: screenVertical * 0.3,
                padding: EdgeInsets.symmetric(
                  horizontal: screenHorizontal * 0.02,
                  vertical: screenVertical * 0.02,
                ),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: gridviewRoute.length,
                  itemBuilder: (context, index) {
                    final route = gridviewRoute[index];
                    final title = route["name"]!;
                    final leading = route["leading"]!;

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          route["route"]!,
                        );
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                leading,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // ? Gridview Random Products
              BlocConsumer<GetAllProductsBloc, GetAllProductsState>(
                listener: (context, state) {
                  if (state is GetAllProductsLoading) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Loading..."),
                      ),
                    );
                  }
                },
                listenWhen: (previous, current) {
                  return current is GetAllProductsLoading;
                },
                builder: (context, state) {
                  if (state is GetAllProductsSuccess) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 60),
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
                            Navigator.pushNamed(
                              context,
                              "/detailPerProduct",
                              // ! kirim index per product pada tiap item di List Tile
                              arguments: product,
                            );
                          },
                          child: Card(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    product.thumbnail,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                      return const Center(
                                        child: Column(
                                          children: [
                                            Text("Tidak dapat memuat gambar"),
                                            Icon(
                                              Icons.error,
                                              color: Colors.red,
                                              size: 100,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "${product.price} USD",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is GetAllProductsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Center(
                      child: Text("No products found."),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
