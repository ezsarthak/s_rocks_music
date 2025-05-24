import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_rocks_music/models/music_service_model.dart';
import 'package:s_rocks_music/utils/dimensions.dart';

class MusicServiceCard extends StatelessWidget {
  const MusicServiceCard({super.key, required this.service});

  final MusicServiceModel service;

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              service.imageUrl,
              fit: BoxFit.fitWidth,
              height: kBottomNavigationBarHeight * 1.2,
              width: dimensions.width,
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          tileColor: Colors.transparent,
          title: Text(
            service.title,
            style: GoogleFonts.syne(
              fontSize: dimensions.h6,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            service.subtitle,
            style: GoogleFonts.syne(
              fontSize: dimensions.h7,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          leading: Image.network(service.icon),
        ),
      ],
    );
  }
}
