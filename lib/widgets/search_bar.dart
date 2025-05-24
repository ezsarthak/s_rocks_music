import 'package:flutter/material.dart';

class MinimalSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Color(0xFF4A5568),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.white70,
            size: 24,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Search "Punjabi Lyrics"',
              style: TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: 16),
          Icon(
            Icons.mic,
            color: Colors.white70,
            size: 24,
          ),
        ],
      ),
    );
  }
}