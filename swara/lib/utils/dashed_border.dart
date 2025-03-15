import 'package:flutter/material.dart';
import 'dart:ui';

class DashedBorder extends BoxBorder {
  const DashedBorder({
    this.top = BorderSide.none,
    this.right = BorderSide.none,
    this.bottom = BorderSide.none,
    this.left = BorderSide.none,
    this.dashPattern = const [3, 1],
  });

  factory DashedBorder.all({
    Color color = const Color(0xFF000000),
    double width = 1.0,
    List<double> dashPattern = const [3, 1],
  }) {
    final BorderSide side = BorderSide(color: color, width: width);
    return DashedBorder(
      top: side,
      right: side,
      bottom: side,
      left: side,
      dashPattern: dashPattern,
    );
  }

  final BorderSide top;
  final BorderSide right;
  final BorderSide bottom;
  final BorderSide left;
  final List<double> dashPattern;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  bool get isUniform => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    if (shape != BoxShape.rectangle) {
      return;
    }

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    
    // Draw top border
    if (top != BorderSide.none) {
      paint.color = top.color;
      paint.strokeWidth = top.width;
      _drawDashedLine(canvas, paint, 
        Offset(rect.left, rect.top), 
        Offset(rect.right, rect.top), 
        dashPattern);
    }

    // Draw right border
    if (right != BorderSide.none) {
      paint.color = right.color;
      paint.strokeWidth = right.width;
      _drawDashedLine(canvas, paint, 
        Offset(rect.right, rect.top), 
        Offset(rect.right, rect.bottom), 
        dashPattern);
    }

    // Draw bottom border
    if (bottom != BorderSide.none) {
      paint.color = bottom.color;
      paint.strokeWidth = bottom.width;
      _drawDashedLine(canvas, paint, 
        Offset(rect.right, rect.bottom), 
        Offset(rect.left, rect.bottom), 
        dashPattern);
    }

    // Draw left border
    if (left != BorderSide.none) {
      paint.color = left.color;
      paint.strokeWidth = left.width;
      _drawDashedLine(canvas, paint, 
        Offset(rect.left, rect.bottom), 
        Offset(rect.left, rect.top), 
        dashPattern);
    }
  }
  
  void _drawDashedLine(Canvas canvas, Paint paint, Offset start, Offset end, List<double> dashPattern) {
    final Path path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(end.dx, end.dy);
      
    canvas.drawPath(
      dashPath(path, dashArray: CircularIntervalList(dashPattern)),
      paint,
    );
  }

  Path dashPath(
    Path source, {
    required CircularIntervalList<double> dashArray,
  }) {
    final Path dest = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0;
      bool draw = true;
      while (distance < metric.length) {
        final double len = dashArray.next;
        if (draw) {
          dest.addPath(
            metric.extractPath(distance, distance + len),
            Offset.zero,
          );
        }
        distance += len;
        draw = !draw;
      }
    }
    return dest;
  }

  @override
  ShapeBorder scale(double t) {
    return DashedBorder(
      top: top.scale(t),
      right: right.scale(t),
      bottom: bottom.scale(t),
      left: left.scale(t),
    );
  }
}

class CircularIntervalList<T> {
  CircularIntervalList(this._values);
  final List<T> _values;
  int _index = 0;
  
  T get next {
    if (_index >= _values.length) {
      _index = 0;
    }
    return _values[_index++];
  }
} 