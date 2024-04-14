import 'package:flutter/material.dart';

AppBar generateStandardAppBar(BuildContext context, String title) {
  return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      )
  );
}