// ignore_for_file: library_private_types_in_public_api

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String? src;

  const VideoScreen({super.key, this.src});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false; // Track the liked state
  bool _isPlaying = true; // Track the playing state
  bool _showLikeIcon = false; // Track the visibility of the like icon

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.src!));
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
      aspectRatio: _videoPlayerController.value.aspectRatio,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
        _isPlaying = false;
      } else {
        _videoPlayerController.play();
        _isPlaying = true;
      }
    });
  }

  void _handleLike() {
    setState(() {
      _liked = !_liked; // Toggle the liked state
      _showLikeIcon = true; // Show the like icon
    });

    // Hide the like icon after 1.5 seconds
    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      setState(() {
        _showLikeIcon = false; // Hide the like icon after 1.5 seconds
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onTap: _togglePlayPause,
                onDoubleTap: _handleLike,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _videoPlayerController.value.size.width,
                    height: _videoPlayerController.value.size.height,
                    child: Chewie(
                      controller: _chewieController!,
                    ),
                  ),
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),

        // Icon play/pause akan ditampilkan di tengah layar
        if (!_isPlaying)
          Center(
            child: Icon(
              Icons.play_circle_filled,
              size: 80,
              color: Colors.white.withOpacity(0.7),
            ),
          ),

        // Tampilkan ikon like setelah double tap
        if (_showLikeIcon)
          const Center(
            child: Icon(
              Icons.favorite,
              size: 110,
              color: Colors.red,
            ),
          ),

        // Oper status _liked ke OptionsScreen
        OptionsScreen(
          liked: _liked,
        ),
      ],
    );
  }
}

class OptionsScreen extends StatelessWidget {
  final bool liked; // Terima status liked

  const OptionsScreen({super.key, required this.liked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 110),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        child: Icon(Icons.person, size: 18),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'user00123',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.verified,
                        size: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Flutter is beautiful and fast 💙❤💛 ..',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.music_note,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text(
                        'Original Audio - some music track--',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  // Tampilkan ikon dengan warna berbeda tergantung liked
                  Icon(
                    liked ? Icons.favorite : Icons.favorite_outline,
                    color: liked ? Colors.red : Colors.white,
                  ),
                  const Text(
                    '601k',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.comment_rounded,
                    color: Colors.white,
                  ),
                  const Text(
                    '1123',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class LikeIcon extends StatelessWidget {
  const LikeIcon({super.key});

  Future<int> tempFuture() async {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: tempFuture(),
        builder: (context, snapshot) =>
            snapshot.connectionState != ConnectionState.done
                ? const Icon(
                    Icons.favorite,
                    size: 110,
                    color: Colors.red,
                  )
                : const SizedBox(),
      ),
    );
  }
}
