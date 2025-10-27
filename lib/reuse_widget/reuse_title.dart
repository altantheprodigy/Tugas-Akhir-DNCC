import 'package:flutter/material.dart';
import 'package:with_space_between/with_space_between.dart';

import '../ui/colors.dart';
import '../ui/typography.dart';

class ReuseTitle extends StatelessWidget {
  final String title;
  const ReuseTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 25,
          width: 10,
          decoration: BoxDecoration(
              color: dark,
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        Text(
          title,
          style: smSemiBold.copyWith(color: dark),
        ),
      ].withSpaceBetween(width: 5),
    );
  }
}
