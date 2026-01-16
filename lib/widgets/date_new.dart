
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.chevron_left),
        SizedBox(width: 4,),
        Text(date,style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),),
        SizedBox(width: 4,),
        Icon(Icons.chevron_right),
      ],);
  }
}
