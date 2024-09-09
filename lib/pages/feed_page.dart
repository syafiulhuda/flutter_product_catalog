// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_field, library_private_types_in_public_api

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_consume_api/widgets/video_screen.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  final List<String> videos = [
    'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  ];

  @override
  Widget build(BuildContext context) {
    // ! MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Swiper(
          itemHeight: screenHeight,
          itemBuilder: (BuildContext context, int index) {
            return VideoScreen(
              src: videos[index],
            );
          },
          itemCount: videos.length,
          scrollDirection: Axis.vertical,
        ),
        const Positioned(
          top: 35,
          right: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TokoSiDia Feed',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );

    // ! Ini error soalnya source harus pakai https, bukan http (masih asumsi)
    // // ! Bloc
    // GetFeedBloc getFeedBloc = context.read<GetFeedBloc>();

    // // ! Dijalankan pertama kali
    // // ! Jalankan event FetchUser setelah frame pertama dirender
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (getFeedBloc.state is GetFeedInitial) {
    //     getFeedBloc.add(FetchVideos());
    //   }
    // });

    // return Scaffold(
    //   body: BlocConsumer<GetFeedBloc, GetFeedState>(
    //     listener: (context, state) {
    //       if (state is GetFeedError) {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(
    //             content: Text(state.message),
    //           ),
    //         );
    //       } else if (state is GetFeedSuccess) {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(
    //             content: Text(
    //               "Total Video: ${state.videos.length}",
    //             ),
    //           ),
    //         );
    //       }
    //     },
    //     listenWhen: (previous, current) {
    //       return current is GetFeedError || current is GetFeedSuccess;
    //     },
    //     builder: (context, state) {
    //       if (state is GetFeedLoading) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else if (state is GetFeedSuccess) {
    //         return Stack(
    //           children: [
    //             Swiper(
    //               itemHeight: screenHeight,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return VideoScreen(
    //                   src: state.videos[index].videoUrl,
    //                 );
    //               },
    //               itemCount: videos.length,
    //               scrollDirection: Axis.vertical,
    //             ),
    //             const Positioned(
    //               top: 35,
    //               right: 0,
    //               left: 0,
    //               child: Padding(
    //                 padding: EdgeInsets.all(8.0),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       'TokoSiDia Feed',
    //                       style: TextStyle(
    //                         fontSize: 22,
    //                         fontWeight: FontWeight.w600,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     Icon(
    //                       Icons.camera_alt,
    //                       color: Colors.white,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         );
    //       } else if (state is GetFeedError) {
    //         return Center(
    //           child: Text(state.message),
    //         );
    //       }

    //       return const Center(
    //         child: Text("Feed Empty"),
    //       );
    //     },
    //   ),
    // );
  }
}
