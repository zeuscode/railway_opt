import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:railway_opt/utils/nl_style.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    // setState(() {
    //   _packageInfo = info;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("关于"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.topCenter,
        child: Column(

          children: [
            SizedBox(
              height: 26.0,
            ),
            Image.asset('assets/images/ic_about_baneer.png'),
            SizedBox(
              height: 8.0,
            ),
            Text(
              '手机令牌 0.0.1',
              style: NLStyle.medium_gray,
            ),
            SizedBox(
              height: 36.0,
            ),
            Text(
              '令牌标识符 ',
              style: NLStyle.medium_gray,
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              '1245 567889 356789 05428 ',
              style: NLStyle.medium_gray,
            ),
          ],
        ),
      ),
    );
  }
}
