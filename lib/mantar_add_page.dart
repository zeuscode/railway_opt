import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:optencrypt/otpencrypt.dart';
import 'package:railway_opt/repositories/mantar_repository.dart';
import 'package:railway_opt/router/router.dart';
import 'package:railway_opt/router/router_link.dart';
import 'package:railway_opt/utils/mantra_util.dart';
import 'package:railway_opt/widget/my_dialog.dart';
import 'package:railway_opt/widget/my_list_tile.dart';
import 'package:railway_opt/widget/my_scan_view.dart';

import 'databases/mantras_database.dart';
import 'model/mantra_model.dart';



class ManTarAddPage extends HookWidget {
  const ManTarAddPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    StatefulWidget l;
    var codeResult = useState('');
    final controller = useTextEditingController(text: '');
    MantarRepository mantarDatabase =
        useMemoized(() => MantarRepository(MantraDatabase()));
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("令牌激活方式",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600)),
          Container(
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            ),
            child: Column(
              children: [
                NFListTile(
                  title: "扫一扫${codeResult.value}",
                  leading: const Icon(Icons.qr_code),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    controller.text = '';
                    await scanQrCode(context, controller, mantarDatabase);
                  },
                ),
                NFListTile(
                  title: "手动激活",
                  leading: const Icon(Icons.keyboard),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Routers().push(context, RouterLink.MANTAR_LIST_PAGE);
                  },
                ),
                NFListTile(
                  title: "一键激活",
                  leading: const Icon(Icons.handyman_rounded),
                  trailing: const Icon(Icons.chevron_right),
                  showBottomDivider: false,
                  onTap: () {
                    showNLCustomContentDialog(context,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                  '检测到手机令牌尚未绑定推送服务器，请先按照下面的方式绑定，在进行以一键激活。'),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      controller.text = '';
                                      scanQrCode(
                                          context, controller, mantarDatabase);
                                    },
                                    child: const Text("扫一扫")),
                              ),
                              SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Routers().push(
                                          context, RouterLink.MANTAR_LIST_PAGE);
                                    },
                                    child: const Text("手动设置")),
                              ),
                              SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("取消")),
                              ),
                            ],
                          ),
                        ));
                    // Routers().push(context, RouterLink.MANTAR_LIST_PAGE);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> scanQrCode(BuildContext context,
      TextEditingController controller, MantarRepository mantarDatabase) async {
    String? code = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MyScanView();
    }));
    if (code == null) return;
    Map<String, String>? paraMap = await OTPEncrypt.decryptQR(code);
    if (paraMap == null || paraMap['code'] == '1') {
      BotToast.showText(text: '${paraMap!['errorlog']}');
      return;
    }

    String? encryptCode = paraMap['token'];
    String? interval = paraMap['interval'];
    String? appCode = paraMap!['appCode'];
    if (encryptCode != null) {
      showNLCustomContentDialog(context,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('请输入激活码'),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 48,
                  child: TextField(
                    // inputFormatters: [
                    //   WhitelistingTextInputFormatter.digitsOnly,
                    // ],
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "请输入激活密码",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("取消")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const Text("确定"))
                  ],
                ),
              ],
            ),
          )).then((value) async {
        if (value!= null ) {
          if (controller.value.text.trim() != appCode) {
            BotToast.showText(text: '激活密码错误==${appCode}');
            return;
          }
          bool isExist = await mantarDatabase
              .isExistCode(encryptCode);
          if (isExist) {
            BotToast.showText(text: '口令已经添加，不能重复添加');
            return;
          }


          MantraModel? mode = await mantarDatabase.addMantar(MantraModel(
              code: encryptCode, interval: interval??"",qrCode: code));
          BotToast.showText(text: '添加成功');


        }
      });
    } else {
      BotToast.showText(text: '非法的二维码');
    }
  }
}
