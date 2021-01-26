import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordTestCasesWidget extends StatelessWidget {
  final String testType;
  final String testName;
  final bool isPassed;

  const PasswordTestCasesWidget({Key key, this.testType, this.testName, this.isPassed = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isPassed
            ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Text(
                testType,
                style: TextStyle(fontSize: 20),
              ),
        SizedBox(
          height: 8,
        ),
        Text(
          testName,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
