part of 'category_list_bloc.dart';

sealed class CategoryListState extends Equatable {
  const CategoryListState();

  @override
  List<Object> get props => [];
}

final class CategoryListInitial extends CategoryListState {}

final class CategoryListLoading extends CategoryListState {}

final class CategoryListSuccess extends CategoryListState {
  final List<String> category;

  const CategoryListSuccess({required this.category});

  @override
  List<Object> get props => [category];
}

final class CategoryListError extends CategoryListState {
  final String message;

  const CategoryListError({required this.message});

  @override
  List<Object> get props => [message];
}
