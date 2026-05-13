import 'package:flutter/material.dart';
import 'package:videoplayer_app/domain/entities/video_post.dart';

class VideoButton extends StatelessWidget {

  final VideoPost video;
  const VideoButton({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _CustomIconButton(value: video.likes, iconData: Icons.favorite, iconColor: Colors.red,),
      SizedBox(height: 10),
      _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_outlined, iconColor: Colors.blue,),
      SizedBox(height: 10),
      _CustomIconButton(value: 0, iconData: Icons.play_arrow_outlined),
      ]
   );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;
  
  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor
  }):color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {}, 
      icon: Icon(iconData, color: color, size: 30)
    );
  }
}
