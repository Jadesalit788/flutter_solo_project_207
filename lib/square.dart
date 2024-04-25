import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  const MySquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.blue,
      child: Column(
        children: [Text('hello')],
      ),
    );
  }
}
