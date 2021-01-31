import 'package:dkatalis_assignment/common/constants.dart';
import 'package:dkatalis_assignment/common/strings.dart';
import 'package:dkatalis_assignment/screens/personal_info_screen.dart';
import 'package:dkatalis_assignment/utils/password_complexity_mixin.dart';
import 'package:dkatalis_assignment/utils/validator.dart';
import 'package:dkatalis_assignment/widgets/dk_app_bar.dart';
import 'package:dkatalis_assignment/widgets/dk_button.dart';
import 'package:dkatalis_assignment/widgets/dk_stepper.dart';
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
  bool _showPassword = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isValidData() {
    return !Validator.isNullOrEmpty(_passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: DKAppBar(
        title: Strings.screen_title,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DKStepper(
                steps: STEPS,
                currentStep: 0,
              ),
              SizedBox(
                height: 48,
              ),
              Text(
                Strings.create_password,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                Strings.password_use_text,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
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
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
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
                      color: Colors.white,
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
        child: DKButton(
          text: Strings.btn_next,
          onClick: _isValidData()
              ? () {
                  print('Password: ${_passwordController.text}');
                  Navigator.of(context).pushNamed(PersonalInfoScreen.routeName);
                }
              : null,
        ),
      ),
    );
  }
}
