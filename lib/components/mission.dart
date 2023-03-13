import 'package:flutter/material.dart';

import '../customprogressMission/intervalprogressbar.dart';
import 'dart:math';

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
            color: Colors.grey[color]),
        margin: const EdgeInsets.all(8),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black54)),
            ),
            Expanded(
              flex: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text('Entry $title'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10,right: 10),
                  child: IntervalProgressBar(
                      max: 3,
                      progress: Random().nextInt(3),
                      intervalSize: 6,
                      size: const Size(double.maxFinite, 8),
                      highlightColor: Colors.black,
                      defaultColor: Colors.grey,
                      intervalColor: Colors.black,
                      intervalHighlightColor: Colors.transparent,
                      radius: 5),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text('Entry $title'),
                ),
              ],
            ))
          ],
        ));
    // child: Center(child: Text('Entry $title')));
  }
}
