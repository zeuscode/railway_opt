import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:railway_opt/setting_page.dart';
import 'constant/Strings.dart';
import 'mantar_add_page.dart';
import 'mantar_input_page.dart';
import 'mantar_list_page.dart';

class HookApp extends HookWidget {
  HookApp({Key? key}) : super(key: key);

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: const Icon(Icons.add_circle), label: Strings.HOME_BAR_ADD),
    BottomNavigationBarItem(
        icon: const Icon(Icons.cloud_circle), label: Strings.HOME_BAR_MANTRA),
    BottomNavigationBarItem(
        icon: const Icon(Icons.settings_outlined),
        label: Strings.HOME_BAR_SETTING),
  ];

  final pages = [
    const ManTarAddPage(),
    const ManTarListPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    String title = Strings.BAR_TITLES[currentIndex.value];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          currentIndex.value = index;
        },
      ),
      body: pages[currentIndex.value],
    );
  }
}
