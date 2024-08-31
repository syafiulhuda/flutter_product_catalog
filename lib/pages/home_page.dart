import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/get_single_product/get_single_product_bloc.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';
import 'package:flutter_consume_api/widgets/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Routes
    final List<Map<String, String>> routes = [
      {"name": "Get Single Product View", "route": "/getSingleProductView"},
      {"name": "Get All Product View", "route": "/getAllProductView"},
    ];

    final screenHorizontal = MediaQuery.of(context).size.width;

    GetSingleProductBloc getSingleProductBlocByName =
        context.read<GetSingleProductBloc>();

    TextEditingController searchBarControler = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(
        centerTile: true,
        widget: Text(
          "Home Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SeacrBarWidget(
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
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: routes.length,
              itemBuilder: (context, index) {
                final route = routes[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      route["route"]!,
                    );
                  },
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(route["name"]!),
                      ),
                      const Divider(height: 5),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
