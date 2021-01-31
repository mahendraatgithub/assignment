import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DKAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DKAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null && title.isNotEmpty ? Text(title) : null,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
