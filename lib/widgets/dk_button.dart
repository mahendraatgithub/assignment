import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DKButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const DKButton({Key key, @required this.text, @required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue[300],
      disabledColor: Colors.grey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      onPressed: onClick,
    );
  }
}
