import 'package:flutter/widgets.dart';

class ProgressPaint extends CustomPainter {
  ProgressPaint(
      this.progress, //进度
      this.width,  //画笔宽度
      this.backgroundColor, //背景画笔颜色
      this.progressColor) {
    //背景画笔
    paintBg = Paint()
      ..color = backgroundColor
      ..strokeWidth = width
      ..isAntiAlias = true //是否开启抗锯齿
      ..style = PaintingStyle.stroke; // 画笔风格，线
    //进度画笔
    paintProgress = Paint()
      ..color = progressColor
      ..strokeWidth = width
      ..isAntiAlias = true //是否开启抗锯齿
      ..strokeCap = StrokeCap.round // 笔触设置为圆角
      ..style = PaintingStyle.stroke;// 画笔风格，线
  }

  final Color backgroundColor;
  final double progress;
  final Color progressColor;
  final double width;

  var paintBg;
  var paintProgress;

  @override
  void paint(Canvas canvas, Size size) {
    //半径，这里为防止宽高不一致，取较小值的一半作为半径大小
    double radius = size.width > size.height ? size.height / 2 : size.width / 2;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paintBg);
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius);
    canvas.drawArc(rect, 0, progress, false, paintProgress);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}