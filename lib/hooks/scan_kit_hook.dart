
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easy_permission/constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_scankit/flutter_scankit.dart';

String useScanKit() {
  return use(_ScanKitHook());
}

class _ScanKitHook extends Hook<String> {
  @override
  HookState<String, Hook<String>> createState() {
    return _ScanKitHookState();
  }
}

class _ScanKitHookState extends HookState<String, _ScanKitHook> {
  late FlutterScankit scanKit;

   late String scanResultValue;


  final _permissions = const [
    Permissions.READ_EXTERNAL_STORAGE,
    Permissions.CAMERA
  ];

  final _permissionGroup = const [
    PermissionGroup.Camera,
    PermissionGroup.Photos
  ];


  @override
  void initHook() {
    super.initHook();
    scanResultValue = "";
    scanKit = FlutterScankit();
    scanKit.addResultListen((val) {
      debugPrint("scanning result:$val");
      setState(() {
        scanResultValue = val;
      });
    });


  }

  @override
  String build(BuildContext context) {
    return scanResultValue;
  }

  @override
  void dispose() {
    scanKit.dispose();
    super.dispose();
  }
}
