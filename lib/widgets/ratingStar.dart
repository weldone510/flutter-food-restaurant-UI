import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/restaurant.dart';

class RatingStar extends StatefulWidget {

  final int rating;
  RatingStar(this.rating);

  @override
  _RatingStarState createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  @override
  Widget build(BuildContext context) {
    String stars = '';
    for(int i=0;i<widget.rating;i++){
      stars = stars+'⭐';
    }
    return Text(stars);
  }
}
