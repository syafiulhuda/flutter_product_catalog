import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:flutter_consume_api/bloc/get_single_product/get_single_product_bloc.dart';
import 'package:flutter_consume_api/models/products.dart';
import 'package:flutter_consume_api/widgets/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Routes
    final List<Map<String, String>> routes = [
      {
        "leading": "assets/delete.png",
        "name": "Single Product",
        "route": "/getSingleProductView"
      },
      {
        "leading": "assets/post.png",
        "name": "All Product",
        "route": "/getAllProductView"
      },
      {
        "leading": "assets/update.png",
        "name": "Categories Product",
        "route": "/category"
      },
      {
        "leading": "assets/delete.png",
        "name": "Single Product",
        "route": "/getSingleProductView"
      },
      {
        "leading": "assets/post.png",
        "name": "All Product",
        "route": "/getAllProductView"
      },
      {
        "leading": "assets/update.png",
        "name": "Categories Product",
        "route": "/category"
      },
      {
        "leading": "assets/delete.png",
        "name": "Single Product",
        "route": "/getSingleProductView"
      },
      {
        "leading": "assets/post.png",
        "name": "All Product",
        "route": "/getAllProductView"
      },
      {
        "leading": "assets/update.png",
        "name": "Categories Product",
        "route": "/category"
      },
      {
        "leading": "assets/delete.png",
        "name": "Single Product",
        "route": "/getSingleProductView"
      },
      {
        "leading": "assets/post.png",
        "name": "All Product",
        "route": "/getAllProductView"
      },
      {
        "leading": "assets/update.png",
        "name": "Categories Product",
        "route": "/category"
      },
      {
        "leading": "assets/delete.png",
        "name": "Single Product",
        "route": "/getSingleProductView"
      },
      {
        "leading": "assets/post.png",
        "name": "All Product",
        "route": "/getAllProductView"
      },
      {
        "leading": "assets/update.png",
        "name": "Categories Product",
        "route": "/category"
      },
    ];

    final screenHorizontal = MediaQuery.of(context).size.width;
    final screenVertical = MediaQuery.of(context).size.height;

    GetSingleProductBloc getSingleProductBlocByName =
        context.read<GetSingleProductBloc>();

    TextEditingController searchBarControler = TextEditingController();

    double appBarHeight = AppBar().preferredSize.height;

    // ! Untuk Section Gridview Random Product
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenVertical * 1.0,
          child: ListView(
            padding: EdgeInsets.only(top: appBarHeight - 10),
            children: [
              const SizedBox(height: 10),
              // ? Search Bar
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: SeacrBarWidget(
                      screenHorizontal: screenHorizontal,
                      searchBarControler: searchBarControler,
                      trailing: [
                        BlocConsumer<GetSingleProductBloc,
                            GetSingleProductState>(
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
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.message, size: 35),
                  const SizedBox(width: 10),
                  const Icon(Icons.notifications, size: 35),
                  const SizedBox(width: 10),
                  const Icon(Icons.menu, size: 35),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 10),
              // ? Alamat
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenHorizontal * 0.02,
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.maps_home_work,
                      color: Colors.greenAccent,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Jl. ABC No. 123, Serpong, Tangerang",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_drop_down_circle_outlined),
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
                  itemCount: routes.length,
                  itemBuilder: (context, index) {
                    final route = routes[index];
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
                    return Container(
                      height: screenVertical * 0.5,
                      padding: const EdgeInsets.all(0),
                      child: GridView.builder(
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
                      ),
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
    );
  }
}
