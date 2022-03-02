import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


// Result useMyHook(BuildContext context) {
//   return use(const _TimeAlive());
//
//
//
// }
 useMyHook(BuildContext context) {
  return use(const _TimeAlive());
}

class _TimeAlive extends Hook<void> {
  const _TimeAlive();

  @override
  _TimeAliveState createState() => _TimeAliveState();
}

class _TimeAliveState extends HookState<void, _TimeAlive> {
  late DateTime start;

  @override
  void initHook() {
    super.initHook();
    start = DateTime.now();
  }

  @override
  void build(BuildContext context) {}

  @override
  void dispose() {
    print(DateTime.now().difference(start));
    super.dispose();
  }
}
