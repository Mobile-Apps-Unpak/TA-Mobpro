import 'package:flutter/material.dart';

AppBar appBarWithLeading(BuildContext context, title) {
  return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      titleTextStyle: Theme.of(context).appBarTheme.toolbarTextStyle,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0);
}
