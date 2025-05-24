import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_rocks_music/models/music_service_model.dart';
import 'package:s_rocks_music/utils/dimensions.dart';
import 'package:s_rocks_music/views/music_service_deatil_screen/ui/music_service_detail_screen.dart';
import 'package:s_rocks_music/widgets/app_text.dart';

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
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder:
                    (context) => MusicServiceDetailScreen(
                      serviceTitle: service.title,
                      serviceSubtitle: service.subtitle,
                    ),
              ),
            );
          },
          contentPadding: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          tileColor: Colors.transparent,
          title: AppText(
            text: service.title,
            fontSize: dimensions.h5,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          subtitle: AppText(
            text: service.subtitle,
            fontSize: dimensions.h7,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          leading: Image.network(service.icon),
          trailing: Icon(Icons.arrow_right_sharp, color: Colors.white),
        ),
      ],
    );
  }
}
