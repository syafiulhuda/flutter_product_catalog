part of 'get_feed_bloc.dart';

sealed class GetFeedEvent extends Equatable {
  const GetFeedEvent();

  @override
  List<Object> get props => [];
}

class FetchVideos extends GetFeedEvent {}
