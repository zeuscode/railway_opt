// ignore: file_names
// ignore: file_names
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

String useTimeAliveHook() {
  return use(const _TimeAlive());
}

class _TimeAlive extends Hook<String> {
  const _TimeAlive();

  @override
  _TimeAliveState createState() => _TimeAliveState();
}

class _TimeAliveState extends HookState<String, _TimeAlive> {
  late DateTime start;

  @override
  void initHook() {
    super.initHook();
    start = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        start = DateTime.now();
      });
    });
  }

  @override
  String build(BuildContext context) {
    return start.toLocal().toString().substring(0, 19);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
