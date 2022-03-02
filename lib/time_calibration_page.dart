import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:railway_opt/router/router.dart';
import 'package:railway_opt/router/router_link.dart';
import 'package:railway_opt/widget/my_list_tile.dart';

class TimeCalibrationPage extends StatelessWidget {
  const TimeCalibrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("时间校准"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    NFListTile(
                      title: "在线校准(推荐)",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Routers()
                            .push(context, RouterLink.LINE_CALIBRATION_PAGE);
                      },
                    ),
                    NFListTile(
                      title: "离线校准",
                      showBottomDivider: false,
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Routers().push(
                            context, RouterLink.OFF_LINE_CALIBRATION_PAGE);
                      },
                    ),
                  ],
                )),
            const SizedBox(
              height: 12,
            ),
            const Text(
                "在线校准要求手机连接网络，将消耗一定的数据流量。开启自动校准，并且连接网络，手机令牌会确定校准时间。离线校准不需要连接到网络，通过手动设置手机令牌时间")
          ],
        ),
      ),
    );
  }
}
