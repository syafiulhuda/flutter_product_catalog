part of 'get_feed_bloc.dart';

sealed class GetFeedState extends Equatable {
  const GetFeedState();

  @override
  List<Object> get props => [];
}

final class GetFeedInitial extends GetFeedState {}

final class GetFeedLoading extends GetFeedState {}

final class GetFeedSuccess extends GetFeedState {
  final List<Feed> videos;

  const GetFeedSuccess({required this.videos});

  @override
  List<Object> get props => [videos];
}

final class GetFeedError extends GetFeedState {
  final String message;

  const GetFeedError({required this.message});

  @override
  List<Object> get props => [message];
}
