import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'hook_app.dart';
import 'router/router.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OPT",
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      routes: Routers().registerRouter(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: HookApp(),
    );
  }
}
