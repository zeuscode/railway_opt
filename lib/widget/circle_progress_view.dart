import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:railway_opt/utils/nl_style.dart';
import 'package:railway_opt/widget/progress_paint.dart';

typedef CompleteCallback = void Function();

class CircleProgressView extends StatefulWidget {
  ///背景圆形色值
  final Color backgroundColor;

  ///当前进度 0-100
  final double progress;

  ///进度条颜色
  final Color progressColor;

  ///圆环宽度
  final double progressWidth;

  ///宽度
  final double width;

  ///高度
  final double height;

  final CompleteCallback? callback;

  const CircleProgressView(
      {Key? key,
      required this.progress,
      required this.width,
      required this.height,
      this.backgroundColor = Colors.grey,
      this.progressColor = Colors.blue,
      this.callback,
      this.progressWidth = 10.0})
      : super(key: key);

  @override
  _CircleProgressViewState createState() => _CircleProgressViewState();
}

class _CircleProgressViewState extends State<CircleProgressView>
    with TickerProviderStateMixin {
  static const double _Pi = 3.14;

  // late Animation<double> animation;
  late AnimationController controller;

  // late CurvedAnimation curvedAnimation;
  // late IntTween intAnim;
  late Animation<int> intAnim;
  late int oldProgress;
  late int second;

  @override
  void didUpdateWidget(covariant CircleProgressView oldWidget) {
    super.didUpdateWidget(oldWidget);


  }

  @override
  void initState() {
    super.initState();
    second = DateTime.now().second;
    oldProgress = 60 - second;
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 60 - second));
    intAnim = IntTween(begin: oldProgress, end: 0).animate(controller);
    intAnim.addListener(() { setState(() {

    });});

    controller.forward();
  }

  //这里是在重新赋值进度时，再次刷新动画
  void startAnimation() {
    oldProgress = 60;
    controller.reset();
    controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 60));
    intAnim = IntTween(begin: oldProgress, end: 0).animate(controller);
    intAnim.addListener(() {
      setState(() {

      });
    });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();

  }

  @override
  Widget build(BuildContext context) {
    if(intAnim!= null && intAnim.isCompleted){
      widget.callback?.call();
      startAnimation();
    }

    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(10),
      child: CustomPaint(
        child: Center(
            child: Text(
          "${intAnim.value.toInt()}",
          style: NLStyle.large_blue_bold,
        )),
        //这里因为我们给的进度一般都是0-100区间
        painter: ProgressPaint(intAnim.value / (60 / 2) * _Pi,
            widget.progressWidth, widget.backgroundColor, widget.progressColor),
      ),
    );
  }
}
