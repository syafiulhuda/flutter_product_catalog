// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_consume_api/models/feed.dart';

import 'package:http/http.dart' as http;

part 'get_feed_event.dart';
part 'get_feed_state.dart';

class GetFeedBloc extends Bloc<GetFeedEvent, GetFeedState> {
  GetFeedBloc() : super(GetFeedInitial()) {
    on<FetchVideos>((event, emit) async {
      try {
        emit(GetFeedLoading());

        Uri url = Uri.parse(
            'https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/14a27bd0bcd0cd323b35ad79cf3b493dddf6216b/videos.json');

        final response = await http.get(url);

        if (response.statusCode == 200) {
          print('Response Body: ${response.body}');

          final List<dynamic> jsonData = json.decode(response.body);

          final List<Feed> videos =
              jsonData.map((data) => Feed.fromMap(data)).toList();

          emit(GetFeedSuccess(videos: videos));
        } else {
          emit(const GetFeedError(message: "Failed to load videos"));
        }
      } catch (e) {
        emit(GetFeedError(message: "Error: $e"));
      }
    });
  }
}
