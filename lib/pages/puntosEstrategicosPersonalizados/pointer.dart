import 'package:flutter/material.dart';

class pointer extends CustomPainter {
  final String label;

  pointer(this.label);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(10));

    paint.color = Colors.white;
    canvas.drawRRect(rRect, paint);

    paint.color = Colors.redAccent;
    canvas.drawCircle(Offset(20, size.height / 2), 10, paint);

    final textpainter = TextPainter(
      text: TextSpan(
          text: this.label,
          style: TextStyle(fontSize: 10, color: Colors.black)),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    );

    textpainter.layout(minWidth: 0, maxWidth: size.width - 20 - 20 - 10);
    textpainter.paint(
        canvas, Offset(40, (size.height / 2) - textpainter.size.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
