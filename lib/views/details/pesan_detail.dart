import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/get_all_cart/get_all_cart_bloc.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';

class PesanDetail extends StatelessWidget {
  const PesanDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTile: false,
        widget: const Text("Chat"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_backup_restore),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocConsumer<GetAllCartBloc, GetAllCartState>(
        listener: (context, state) {},
        listenWhen: (previous, current) {
          return current is GetAllCartError || current is GetAllCartSuccess;
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ListTile(
                leading: Icon(Icons.pie_chart_rounded),
                title: Text("Nama Toko"),
                subtitle: Text("Siap kak"),
                trailing: Text("1 jam"),
              );
            },
          );
        },
      ),
    );
  }
}
