//
//
//
// class SecuritySettingsPage extends Stat

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:railway_opt/widget/my_list_tile.dart';
import 'package:local_auth/local_auth.dart';

// class SecuritySettingsPage extends StatelessWidget {
//   const SecuritySettingsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }
class SecuritySettingsPage extends HookWidget {

  Future<bool> _authenticate(LocalAuthentication auth) async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason: '扫描指纹进行身份验证',
          useErrorDialogs: true,
          stickyAuth: false,
          biometricOnly: true);
    } on PlatformException catch (e) {}
    return authenticated;
  }

  @override
  Widget build(BuildContext context) {
    final _auth = useMemoized(() => LocalAuthentication());
    final _authenticated = useFuture(_authenticate(_auth));

    return Scaffold(
      appBar: AppBar(
        title: const Text("安全设置"),
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
                      title: "PIN码",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    NFListTile(
                      title: "手势密码",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    NFListTile(
                      title: "指纹",
                      trailing: const Icon(Icons.chevron_right),
                      showBottomDivider: false,
                      onTap: () {
                        _authenticated.hasData;
                      },
                    ),
                  ],
                )),
            const SizedBox(
              height: 12,
            ),
            const Text("开启指纹保护必须开启PIN码，手势密码不能与其他安全保护同时开启")
          ],
        ),
      ),
    );
  }
}
