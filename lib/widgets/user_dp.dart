
import 'package:flutter/material.dart';

class UserDp extends StatelessWidget {
  const UserDp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: Colors.grey,
      child: ClipOval(
        child: Image.network('https://i.pinimg.com/736x/39/f1/01/39f101aec90ac8fef2b9d536ec9d1a23.jpg',
          fit: BoxFit.cover,
          width: 80,
          height: 80,
          errorBuilder: (context , error ,stackTree){
            return Icon(Icons.person);
          },
        ),
      ),
    );
  }
}
