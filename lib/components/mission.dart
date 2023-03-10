import 'package:flutter/material.dart';

class Mission extends StatelessWidget {
  const Mission({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.amber[color]),
        margin: const EdgeInsets.all(8),
        height: 100,
        child: Center(child: Text('Entry $title')));
  }
}
