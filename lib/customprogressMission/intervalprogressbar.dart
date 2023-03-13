import 'dart:ui';
import 'package:flutter/widgets.dart';

class IntervalProgressBar extends StatelessWidget {
  final int max;
  final int progress;
  final int intervalSize;
  final Size size;
  final Color highlightColor;
  final Color defaultColor;
  final Color intervalColor;
  final Color intervalHighlightColor;
  final double radius;
  final bool reverse;
  final double intervalDegrees;
  final double strokeWith;

  const IntervalProgressBar(
      {Key? key,
      required this.max,
      required this.progress,
      required this.intervalSize,
      required this.size,
      required this.highlightColor,
      required this.defaultColor,
      required this.intervalColor,
      required this.intervalHighlightColor,
      required this.radius,
      this.reverse = false,
      this.intervalDegrees = 0.0,
      this.strokeWith = 0})
      : super(key: key);

  static const TRANSPARENT = Color.fromARGB(0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    CustomPainter painter;
    painter = HorizontalProgressPainter(
        max,
        progress,
        intervalSize,
        highlightColor,
        defaultColor,
        intervalColor,
        intervalHighlightColor,
        radius,
        reverse);
    return CustomPaint(painter: painter, size: size);
  }
}

abstract class IntervalProgressPainter extends CustomPainter {
  final int max;
  final int progress;
  final int intervalSize;
  final Color highlightColor;
  final Color defaultColor;
  final Color intervalColor;
  final Color intervalHighlightColor;
  final double radius;
  final bool reverse;
  final double intervalDegrees;

  final Paint painter = Paint()
    ..style = PaintingStyle.fill
    ..isAntiAlias = true;

  late Rect bound;

  IntervalProgressPainter(
      this.max,
      this.progress,
      this.intervalSize,
      this.highlightColor,
      this.defaultColor,
      this.intervalColor,
      this.intervalHighlightColor,
      this.radius,
      this.reverse,
      this.intervalDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    if (progress > max) {
      throw Exception("progress must <= max");
    }
    bound = Offset.zero & size;
    Size blockSize = calBlockSize();
    for (int i = 0; i < max; i++) {
      paintBlock(canvas, i, blockSize);
    }

    for (int i = 0; i < max; i++) {
      paintBlockInterval(canvas, i, blockSize);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final old = oldDelegate as IntervalProgressPainter;
    return old.max != max ||
        old.progress != progress ||
        old.intervalSize != intervalSize ||
        old.intervalColor != intervalColor ||
        old.defaultColor != defaultColor ||
        old.highlightColor != highlightColor ||
        old.intervalHighlightColor != intervalHighlightColor ||
        old.radius != radius ||
        old.intervalDegrees != intervalDegrees;
  }

  bool highlightBlock(int index) =>
      reverse ? index >= (max - progress) : index < progress;

  bool highlightInterval(int index) =>
      reverse ? index >= (max - progress - 1) : index < progress - 1;

  void paintBlock(Canvas canvas, int blockIndex, Size blockSize);

  void paintBlockInterval(Canvas canvas, int blockIndex, Size blockSize);

  Size calBlockSize();

  bool shouldDrawStartRadius(int index) => index == 0 && radius > 0;

  bool shouldDrawEndRadius(int index) => index == max - 1 && radius > 0;

  bool shouldDrawInterval(int index) =>
      index != max &&
      (intervalColor != IntervalProgressBar.TRANSPARENT ||
          intervalHighlightColor != IntervalProgressBar.TRANSPARENT);
}

class HorizontalProgressPainter extends IntervalProgressPainter {
  HorizontalProgressPainter(
      int max,
      int progress,
      int intervalSize,
      Color highlightColor,
      Color defaultColor,
      Color intervalColor,
      Color intervalHighlightColor,
      double radius,
      bool reverse)
      : super(max, progress, intervalSize, highlightColor, defaultColor,
            intervalColor, intervalHighlightColor, radius, reverse, 0.0);

  @override
  Size calBlockSize() =>
      Size(((bound.width - intervalSize * (max - 1)) / max), bound.height);

  @override
  void paintBlock(Canvas canvas, int i, Size blockSize) {
    final blockWidth = blockSize.width;
    final highlight = highlightBlock(i);
    final dx = (blockWidth) * i;
    Rect rect = Rect.fromLTRB(0, 0, blockWidth, bound.height);
    painter.color = highlight ? highlightColor : defaultColor;
    canvas.save();
    canvas.translate(dx, 0);
    if (shouldDrawStartRadius(i)) {
      rect = _drawLeftRound(canvas, rect);
    }

    if (shouldDrawEndRadius(i)) {
      rect = _drawRightRound(canvas, rect);
    }
    canvas.drawRect(rect, painter);
    canvas.restore();
  }

  @override
  void paintBlockInterval(Canvas canvas, int blockIndex, Size blockSize) {
    final blockWidth = blockSize.width;
    final dx = (blockWidth) * blockIndex;
    canvas.save();
    canvas.translate(dx, 0);
    if (shouldDrawInterval(blockIndex)) {
      painter.color = intervalColor;
      canvas.drawCircle(Offset(blockWidth.toDouble(), bound.height / 2),
          intervalSize.toDouble(), painter);
    }
    canvas.restore();
  }

  Rect _drawLeftRound(Canvas canvas, Rect rect) {
    final clipRect =
        Rect.fromLTRB(rect.left + radius, rect.top, rect.right, rect.bottom);
    _drawRadius(canvas, rect, clipRect);
    return clipRect;
  }

  Rect _drawRightRound(Canvas canvas, Rect rect) {
    final clipRect =
        Rect.fromLTRB(rect.left, rect.top, rect.right - radius, rect.bottom);
    _drawRadius(canvas, rect, clipRect);
    return clipRect;
  }

  void _drawRadius(Canvas canvas, Rect rect, Rect clipRect) {
    final roundRect = RRect.fromLTRBR(
        rect.left, rect.top, rect.right, rect.bottom, Radius.circular(radius));
    final path = Path()..addRRect(roundRect);
    canvas.save();
    canvas.clipRect(clipRect, clipOp: ClipOp.difference);
    canvas.drawPath(path, painter);
    canvas.restore();
  }
}
