import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:optencrypt/otpencrypt.dart';
import 'package:railway_opt/model/mantra_model.dart';
import 'package:railway_opt/repositories/mantar_repository.dart';
import 'package:railway_opt/router/router.dart';
import 'package:railway_opt/router/router_link.dart';
import 'package:railway_opt/widget/my_list_tile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'databases/mantras_database.dart';

class ManTarListPage extends HookWidget {
  const ManTarListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MantarRepository mantarDatabase =
        useMemoized(() => MantarRepository(MantraDatabase()));

    AsyncSnapshot<List<MantraModel>> mantarsSnapshot =
        useFuture(mantarDatabase.getMantras());
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("已激活的令牌:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 16.0,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _itemBuilder(context, mantarsSnapshot.data!, index);
                },
                separatorBuilder: (_, __) => const Divider(
                      height: 0.5,
                    ),
                itemCount: mantarsSnapshot.data?.length ?? 0),
          ],
        ));
  }

  Widget _itemBuilder(
          BuildContext context, List<MantraModel> datas, int index) =>
      GestureDetector(
          onTap: () async {
           String? opt = await  OTPEncrypt.calOTP(datas[index].qrCode!);
           if(opt!=null) {
             Routers().push(context, RouterLink.MANTAR_DETAIL_PAGE,
                 value: {'code': datas[index].toJson(),
                   'opt':opt});
           }
          },
          child: Slidable(
            key: Key(datas[index].code),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {
                MantraDatabase().remove(datas[index].code)..then((value){
                  if(value!=null && value <= 0 ){
                    BotToast.showText(text: '删除失败');
                  }else{
                    datas.removeAt(index);
                  }
                });
              }),
              children:  [
                SlidableAction(
                  backgroundColor: const Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: '删除',
                  onPressed: (BuildContext context){
                    MantraDatabase().remove(datas[index].code)..then((value){
                      if(value!=null && value <= 0 ){
                        BotToast.showText(text: '删除失败');
                      }else{
                        datas.removeAt(index);
                      }
                    });
                  },
                ),
              ],
            ),
            child: ListTile(
              title: Text(datas[index].code),
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.all_inclusive_sharp),
            ),
          ));


}
