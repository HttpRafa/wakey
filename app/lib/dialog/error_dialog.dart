import 'package:flutter/material.dart';

void showFailedDialog(BuildContext context, String title, String message) {
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
    ],
  ));
}