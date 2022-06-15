import 'package:flutter/material.dart';

AppBar appBarWithoutLeading(BuildContext context, title) {
  return AppBar(
    leading: const SizedBox(),
    iconTheme: Theme.of(context).iconTheme,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
    elevation: 0,
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    titleTextStyle: Theme.of(context).appBarTheme.toolbarTextStyle,
  );
}
