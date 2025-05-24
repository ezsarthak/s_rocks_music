import 'package:flutter/material.dart';
import 'package:s_rocks_music/widgets/app_text.dart';

class MusicServiceDetailScreen extends StatelessWidget {
  final String serviceTitle;
  final String serviceSubtitle;
  const MusicServiceDetailScreen({
    super.key,
    required this.serviceTitle,
    required this.serviceSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18171C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: serviceTitle,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            AppText(
              text: serviceSubtitle,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
