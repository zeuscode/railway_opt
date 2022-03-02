import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:railway_opt/hooks/use_time_alive_Hook.dart';
import 'package:railway_opt/utils/nl_style.dart';
import 'package:railway_opt/widget/my_dialog.dart';

class OffLineCalibrationPage extends HookWidget {
  const OffLineCalibrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currTime = useTimeAliveHook();

    return Scaffold(
      appBar: AppBar(
        title: const Text("离线校准"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '手机系统时间:',
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 6.0),
            Text(
              currTime,
              style: NLStyle.large_blue,
            ),
            const SizedBox(
              height: 6.0,
            ),
            const Text('手机令牌时间:'),
            const SizedBox(height: 6.0),
            Text(
              currTime,
              style: NLStyle.large_blue,
            ),
            const SizedBox(height: 6.0),
            const Text('设置标准时间(GMT+08:00):'),
            const SizedBox(height: 6.0),
            TextField(
              controller: TextEditingController(text: currTime),
              decoration: const InputDecoration(),
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showNLAlertDialog(context,content: '校准成功');
                    },
                    child: const Text('校  准'),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('重  制'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
