import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccoutManagertPage extends StatelessWidget {
  const AccoutManagertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("账号管理"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '暂无绑定账号*:',
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
