import 'package:dkatalis_assignment/common/constants.dart';
import 'package:dkatalis_assignment/common/strings.dart';
import 'package:dkatalis_assignment/screens/password_setup_screen.dart';
import 'package:dkatalis_assignment/utils/snack_bar_mixin.dart';
import 'package:dkatalis_assignment/utils/validator.dart';
import 'package:dkatalis_assignment/widgets/dk_button.dart';
import 'package:dkatalis_assignment/widgets/dk_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreenController {
  Function() onSubmit;
}

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';
  final WelcomeScreenController controller = WelcomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreenBody(controller),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DKButton(
          text: Strings.btn_next,
          onClick: () {
            controller.onSubmit();
          },
        ),
      ),
    );
  }
}

class WelcomeScreenBody extends StatefulWidget {
  final WelcomeScreenController controller;

  WelcomeScreenBody(this.controller);

  @override
  _WelcomeScreenBodyState createState() => _WelcomeScreenBodyState(controller);
}

class _WelcomeScreenBodyState extends State<WelcomeScreenBody> with SnackBarMixin {
  final TextEditingController _emailController = TextEditingController();

  _WelcomeScreenBodyState(WelcomeScreenController controller) {
    if (controller != null) {
      controller.onSubmit = onSubmit;
    }
  }

  bool _isValidData() {
    return Validator.isValidEmailId(_emailController.text);
  }

  void onSubmit() {
    print('Email: ${_emailController.text}');
    if (_isValidData()) {
      Navigator.of(context).pushNamed(PasswordSetupScreen.routeName);
    } else {
      print('Invalid Email: ${_emailController.text}');
      showMessage(context, 'Invalid email.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 56,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DKStepper(
                steps: STEPS,
              ),
            ),
            SizedBox(
              height: 56,
            ),
            Text(
              Strings.welcome_screen_heading1,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            RichText(
              text: TextSpan(
                text: Strings.welcome_screen_heading2,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                children: [
                  TextSpan(
                    text: ' ${Strings.welcome_screen_finans}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              Strings.welcome_screen_message,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1a000000),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0x10000000),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    hintText: Strings.email,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
