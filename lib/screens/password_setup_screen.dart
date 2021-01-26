import 'package:dkatalis_assignment/common/strings.dart';
import 'package:dkatalis_assignment/utils/password_complexity_mixin.dart';
import 'package:dkatalis_assignment/widgets/password_test_cases_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordSetupScreen extends StatefulWidget {
  static const routeName = '/password-setup';

  @override
  _PasswordSetupScreenState createState() => _PasswordSetupScreenState();
}

class _PasswordSetupScreenState extends State<PasswordSetupScreen> with PasswordComplexityChecker {
  final TextEditingController _passwordController = TextEditingController();
  String password;
  bool _showPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
              ),
              Text(
                Strings.create_password,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                Strings.password_use_text,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _passwordController,
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
                  ),
                  hintText: Strings.create_password,
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  print('Password: $value');
                  updateStatus(value);
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                children: [
                  Text(
                    '${Strings.complexity}:',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      getComplexity(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PasswordTestCasesWidget(
                    testType: 'a',
                    testName: Strings.lowercase,
                    isPassed: hasLowercase(_passwordController.text),
                  ),
                  PasswordTestCasesWidget(
                    testType: 'A',
                    testName: Strings.uppercase,
                    isPassed: hasUppercase(_passwordController.text),
                  ),
                  PasswordTestCasesWidget(
                    testType: '123',
                    testName: Strings.number,
                    isPassed: hasNumber(_passwordController.text),
                  ),
                  PasswordTestCasesWidget(
                    testType: '9+',
                    testName: Strings.characters,
                    isPassed: hasSpecialCharacter(_passwordController.text),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              Strings.btn_next,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          onPressed: () {
            print('Email: ${_passwordController.text}');
          },
        ),
      ),
    );
  }
}
