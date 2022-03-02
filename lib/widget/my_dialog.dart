import 'package:flutter/material.dart';

// Widget okButton = TextButton(
//   child: Text("OK"),
//   onPressed: () { },
// );
//
// // set up the AlertDialog
// AlertDialog alert = ;
// //

Future showNLAlertDialog(BuildContext context,
    {required String content, String? title}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? "提示"),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("确定")),
          ],
        );
      });
}

Future showNLCustomContentDialog(BuildContext context,
    {required Widget child}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: child,
        );
      });
}
