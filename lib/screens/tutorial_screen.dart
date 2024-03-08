import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TutorialScreen extends StatelessWidget {
  TutorialScreen({super.key});

  final List<VideoInfo> videos = [
    VideoInfo(
      title: 'How to start a small farm | A step by step guide',
      thumbnailUrl:
          'https://i.ytimg.com/vi/heTxEsrPVdQ/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCa7P8REtbl9y5CZrLqz6qF6ydTgA',
      duration: '00:17:57',
      videoUrl:
          'https://www.youtube.com/watch?v=heTxEsrPVdQ&pp=ygUVZmFybWluZyBmb3IgYmVnaW5uZXJz',
    ),
    VideoInfo(
      title: 'Beginner\'s guide to understanding fertilizers and nutrients',
      thumbnailUrl:
          'https://i.ytimg.com/vi/gQw-0b_Lw5s/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDFDJRqpNdA5_x2TLH5b4tjBHMAqQ',
      duration: '00:18:35',
      videoUrl:
          'https://www.youtube.com/watch?v=gQw-0b_Lw5s&pp=ygURZmVydGlsaXplciBndWlkZSA%3D',
    ),
    // Add more VideoInfo objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _launchURL(
                Uri.parse(videos[index].videoUrl),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: Image.network(
                  videos[index].thumbnailUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(videos[index].title),
                subtitle: Text(videos[index].duration),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class VideoInfo {
  final String title;
  final String thumbnailUrl;
  final String duration;
  final String videoUrl;

  VideoInfo({
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.videoUrl,
  });
}
