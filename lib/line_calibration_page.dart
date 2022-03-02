import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:railway_opt/hooks/use_time_alive_Hook.dart';
import 'package:railway_opt/utils/nl_style.dart';
import 'package:railway_opt/widget/my_dialog.dart';
import 'package:railway_opt/widget/my_list_tile.dart';

class LineCalibrationPage extends HookWidget {
  const LineCalibrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currTime = useTimeAliveHook();
    final calibrationAuto = useState(true);
    final calibrationWifi = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("在线校准"),
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
            const SizedBox(height: 16.0),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    showNLAlertDialog(context,content: '同步成功');
                  },
                  child: const Text('立即校准'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            NFListTile(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                trailing: Switch(
                  value: calibrationAuto.value,
                  onChanged: (b) {
                    calibrationAuto.value = b;
                  },
                ),
                border: Border.all(color: Colors.black12),
                title: '自动校准',
                onTap: () {}),
            const SizedBox(height: 6.0),
            Offstage(
              offstage: !calibrationAuto.value,
              child: NFListTile(
                  trailing: Switch(
                    value: calibrationWifi.value,
                    onChanged: (b) {
                      calibrationWifi.value = b;
                    },
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  border: Border.all(color: Colors.black12),
                  title: '仅Wifi联网时',
                  onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
