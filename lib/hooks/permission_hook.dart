import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useRequestPermission(
    List<Permissions> perms, List<PermissionGroup> permsGroup,
    {Granted? onGranted, Denied? onDenied, VoidCallback? onSettingsReturned}) {
  return use(
    _PermissionHook(perms, permsGroup,
        onGranted: onGranted,
        onDenied: onDenied,
        onSettingsReturned: onSettingsReturned),
  );
}

class _PermissionHook extends Hook<void> {
  final List<Permissions> perms;
  final List<PermissionGroup> permsGroup;
  Granted? onGranted;
  Denied? onDenied;
  VoidCallback? onSettingsReturned;

  _PermissionHook(this.perms, this.permsGroup,
      {Granted? onGranted, Denied? onDenied, VoidCallback? onSettingsReturned});

  @override
  HookState<void, Hook<void>> createState() {
    return _PermissionHookState();
  }
}

class _PermissionHookState extends HookState<void, _PermissionHook> {
  late FlutterEasyPermission _easyPermission;

  @override
  void initHook() {
    super.initHook();
    _easyPermission = FlutterEasyPermission()
      ..addPermissionCallback(
        onGranted: (requestCode, perms, perm) {
          hook.onGranted!(requestCode, perms, perm);
        },
        onDenied: (requestCode, perms, perm, isPermanent) {
          hook.onDenied!(requestCode, perms, perm, isPermanent);
        },
      );
  }

  @override
  void build(BuildContext context) {
    return FlutterEasyPermission.request(
        perms: hook.perms, permsGroup: hook.permsGroup, rationale: "");
  }

  @override
  void dispose() {
    super.dispose();
    _easyPermission.dispose();
  }
}
