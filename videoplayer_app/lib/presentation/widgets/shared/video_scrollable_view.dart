import 'package:flutter/material.dart';
import 'package:videoplayer_app/domain/entities/video_post.dart';
import 'package:videoplayer_app/presentation/widgets/shared/video_button.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({
    super.key, 
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: Text('Pantalla Fullscreen'), // Pantalla Fullscreen
            ),

            // Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButton(video: videoPost),
            ), //Pantalla Fullscreen  
          ],
        );
      },
    );
  }
}
