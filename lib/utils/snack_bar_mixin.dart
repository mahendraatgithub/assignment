import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mixin SnackBarMixin {
  showMessage(BuildContext context, String msg) {
    if (context == null || msg == null) {
      return;
    }
    final snackBar = SnackBar(content: Text(msg));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
