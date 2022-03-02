import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gesture_unlock/gesture_unlock_view.dart';

class GestureUnlockPage extends StatelessWidget {
  const GestureUnlockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureUnlockView(
          size: 331,
          //设置大点，让触摸区域变大。让触摸更有效。
          padding: 40,
          roundSpace: 40,
          defaultColor: const Color(0xFFE3E4E6),
          selectedColor: const Color(0xFF3776E9),
          failedColor: const Color(0xFFFF5656),
          disableColor: const Color(0xFF30E3E4E6),
          solidRadiusRatio: 0.3,
          lineWidth: 2,
          touchRadiusRatio: 0.3,
          onCompleted: (_, __) {

          }),
    );
  }
}
