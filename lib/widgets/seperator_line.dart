
import 'package:flutter/material.dart';

class SeperatorLine extends StatelessWidget {
  const SeperatorLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: VerticalDivider(
        color: Colors.grey,
        thickness: 1,
      ),
    );
  }
}
