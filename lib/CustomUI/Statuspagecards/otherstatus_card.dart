import 'dart:math';

import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus(
      {super.key,
      required this.name,
      required this.image,
      required this.time,
      required this.isStatusviewed,
      required this.statuscount});
  final String name;
  final String image;
  final String time;
  final bool isStatusviewed;
  final int statuscount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: statusCirclepainter(
            isStatusviewed: isStatusviewed, statuscount: statuscount),
        child: CircleAvatar(
          radius: 27,
          backgroundImage: AssetImage("assets/$image"),
        ),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
      subtitle: Text('Today at $time'),
    );
  }
}

degreeToAngle(double degree) {
  return degree * pi / 180;
}

class statusCirclepainter extends CustomPainter {
  final bool? isStatusviewed;
  final int? statuscount;

  statusCirclepainter({this.isStatusviewed, this.statuscount});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..color = isStatusviewed! ? Color(0xff21bfa6) : Colors.grey
      ..style = PaintingStyle.stroke;
    drawcircle(canvas, paint, size);
  }

  void drawcircle(Canvas canvas, Paint paint, Size size) {
    if (statuscount == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToAngle(0), degreeToAngle(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / statuscount!;
      for (int i = 0; i < statuscount!; i++) {
        canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            degreeToAngle(degree + 4), degreeToAngle(arc - 7), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
