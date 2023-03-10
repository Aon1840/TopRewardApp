import 'package:flutter/material.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';

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
        child: Row(
          children: [
            Container(
                height: 80,
                width: 80,
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black54)),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text('Entry $title'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: IntervalProgressBar(
                      direction: IntervalProgressDirection.horizontal,
                      max: 3,
                      progress: 1,
                      intervalSize: 3,
                      size: Size(200, 10),
                      highlightColor: Colors.black,
                      defaultColor: Colors.grey,
                      intervalColor: Colors.pink,
                      intervalHighlightColor: Colors.transparent,
                      radius: 5),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text('Entry $title'),
                ),
              ],
            )
          ],
        ));
    // child: Center(child: Text('Entry $title')));
  }
}
