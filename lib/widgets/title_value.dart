
import 'package:flutter/material.dart';

class TitleValue extends StatelessWidget {
  const TitleValue({
    super.key,
    required this.name
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text('${name}',style: TextStyle(
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
        fontSize: 15
    ),);
  }
}