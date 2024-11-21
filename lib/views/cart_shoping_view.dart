import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/get_all_cart/get_all_cart_bloc.dart';
import 'package:flutter_consume_api/models/cart.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartShopingView extends StatelessWidget {
  const CartShopingView({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Bloc
    GetAllCartBloc getAllCartBloc = context.read<GetAllCartBloc>();

    // ! Dijalankan pertama kali
    // ! Jalankan event FetchUser setelah frame pertama dirender
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (getAllCartBloc.state is GetAllCartInitial) {
        getAllCartBloc.add(
          FetchAllCart(
            cart: Cart(
              carts: [],
              limit: 0,
              skip: 0,
              total: 10,
            ),
          ),
        );
      }
    });

    return Scaffold(
      appBar: const CustomAppBar(
        color: Colors.white,
        widget: Text("Keranjang"),
        actions: [
          FaIcon(FontAwesomeIcons.heart),
          SizedBox(width: 10),
          FaIcon(FontAwesomeIcons.burger),
          SizedBox(width: 10),
        ],
      ),
      body: BlocConsumer<GetAllCartBloc, GetAllCartState>(
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllCartSuccess) {
            return ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Nama Toko",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "ID: ${state.getAllCartModel.carts[index].id.toString()}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                state.getAllCartModel.carts[index].products[0]
                                    .thumbnail,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.getAllCartModel.carts[index]
                                        .products[0].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                      "${state.getAllCartModel.carts[index].products[0].price} USD"),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: const Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Warna Hitam, clear"),
                                            Icon(
                                              Icons.arrow_drop_down_sharp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(Icons.delete),
                              const SizedBox(width: 10),
                              Text("$index"),
                              const SizedBox(width: 10),
                              const Icon(Icons.add),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("No Carts"),
            );
          }
        },
      ),
    );
  }
}
