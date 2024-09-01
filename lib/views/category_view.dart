import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/bloc/category_list/category_list_bloc.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryListBloc categoryListBloc = context.read<CategoryListBloc>();

    // ! Dijalankan pertama kali
    // ! Jalankan event FetchUser setelah frame pertama dirender
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (categoryListBloc.state is CategoryListInitial) {
        categoryListBloc.add(
          FetchCategory(),
        );
      }
    });

    return Scaffold(
      appBar: const CustomAppBar(widget: Text("Category")),
      body: BlocConsumer<CategoryListBloc, CategoryListState>(
        listener: (context, state) {
          if (state is CategoryListError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is CategoryListSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Successfully fetched categories"),
              ),
            );
          }
        },
        listenWhen: (previous, current) {
          return current is CategoryListError || current is CategoryListSuccess;
        },
        builder: (context, state) {
          if (state is CategoryListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryListSuccess) {
            return ListView.builder(
              itemCount: state.category.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.category[index]),
                  onTap: () {},
                );
              },
            );
          } else if (state is CategoryListError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(child: Text('No categories available.'));
        },
      ),
    );
  }
}
