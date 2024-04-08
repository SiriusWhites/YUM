import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final Color color;

  const RatingWidget({
    Key? key,
    required this.rating,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rating.floor()
              ? Icons.star
              : index < rating
                  ? Icons.star_half
                  : Icons.star_border,
          color: color,
          size: 18.0,
        ),
      ),
    );
  }
}