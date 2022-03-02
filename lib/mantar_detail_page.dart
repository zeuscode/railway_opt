import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:optencrypt/otpencrypt.dart';
import 'package:railway_opt/utils/json_config.dart';
import 'package:railway_opt/widget/circle_progress_view.dart';

import 'model/mantra_model.dart';

class MantarDetailPage extends HookWidget{
  const MantarDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map dataInfo = JsonConfig.objectToMap(
        ModalRoute.of(context)!.settings.arguments.toString());
    MantraModel model = MantraModel.fromJson(dataInfo['code']);
    String opt = dataInfo['opt'];
    ValueNotifier<String> otpCoded = useState(opt);
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text:  otpCoded.value)).then((value) {
          BotToast.showText(text: '复制成功');
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${model.code}'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("请输入以下口令进行认证",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 12.0),
              Text('${otpCoded.value}',
                  style: const TextStyle(
                      color: Colors.indigo,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 12.0),
              CircleProgressView(
                progress: 100,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                progressWidth: 26,
                callback: () async {
                  String? callOpt = await OTPEncrypt.calOTP(model.qrCode!);
                  if(callOpt!=null){
                    otpCoded.value = callOpt;
                  }
                },
              ),
              const SizedBox(height: 16.0),
              const Text("*长按屏幕可以对口令进行复制")
            ],
          ),
        ),
      ),
    );
  }


}




