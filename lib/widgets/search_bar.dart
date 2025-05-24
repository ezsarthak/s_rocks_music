import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_rocks_music/utils/dimensions.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFF2F2F39),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.white, size: 24),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Search "Punjabi Lyrics"',
              style: GoogleFonts.syne(
                fontSize: dimensions.h6,
                fontWeight: FontWeight.w700,
                color: Color(0xFF61616B),
              ),
            ),
          ),
          SizedBox(width: 16),
          Icon(Icons.mic, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
