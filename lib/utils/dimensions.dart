import 'package:flutter/material.dart';

class Dimensions {
  final BuildContext context;
  Dimensions(this.context);
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  double get unitWidth => MediaQuery.of(context).size.width * 0.01;

  /// Page Padding
  late double topPadding = unitWidth * 10;

  /// Text Size
  late double h1 = MediaQuery.of(context).size.width * (32 / 375);
  late double h3 = MediaQuery.of(context).size.width * (24 / 375);
  late double h4 = MediaQuery.of(context).size.width * (18 / 375);
  late double h5 = MediaQuery.of(context).size.width * (16 / 375);
  late double h6 = MediaQuery.of(context).size.width * (15 / 375);
  late double h7 = MediaQuery.of(context).size.width * (13 / 375);

}
