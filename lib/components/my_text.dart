import 'package:flutter/material.dart';


class MyText extends StatelessWidget {

  final String name;

  const MyText(this.name);

  @override
  Widget build(BuildContext context) {
    return  Text(name.toUpperCase(),
      style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
    );
  }
}
