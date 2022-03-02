import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:railway_opt/router/router.dart';
import 'package:railway_opt/router/router_link.dart';
import 'package:railway_opt/widget/my_list_tile.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NFListTile(
              title: "安全设置",
              leading: const Icon(Icons.security_outlined),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Routers().push(context, RouterLink.SECURITY_SETTINGS_PAGE);
              },
            ),
            NFListTile(
              title: "账号管理",
              leading: const Icon(Icons.account_box_outlined),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Routers().push(context, RouterLink.ACCOUNT_MANAGER);
              },
            ),
            NFListTile(
              title: "时间校准",
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Routers().push(context, RouterLink.TIME_CALIBRATION_PAGE);
              },
            ),
            NFListTile(
              title: "关于令牌",
              onTap: () {
                Routers().push(context, RouterLink.ABOUT_PAGE);
              },
              leading: const Icon(Icons.description_rounded),
              trailing: const Icon(Icons.chevron_right),
              showBottomDivider: false,
            ),
          ],
        ),
      ),
    );
  }
}
