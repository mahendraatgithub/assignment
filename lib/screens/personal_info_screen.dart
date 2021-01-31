import 'package:dkatalis_assignment/common/constants.dart';
import 'package:dkatalis_assignment/common/strings.dart';
import 'package:dkatalis_assignment/screens/schedule_screen.dart';
import 'package:dkatalis_assignment/utils/validator.dart';
import 'package:dkatalis_assignment/widgets/dk_app_bar.dart';
import 'package:dkatalis_assignment/widgets/dk_button.dart';
import 'package:dkatalis_assignment/widgets/dk_stepper.dart';
import 'package:dkatalis_assignment/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonalInfoScreen extends StatefulWidget {
  static const routeName = '/personal-info';

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final DropDownController _goalController = DropDownController();
  final DropDownController _incomeController = DropDownController();
  final DropDownController _expenseController = DropDownController();

  bool _isValidData() {
    return !(Validator.isNullOrEmpty(_goalController.value) ||
        Validator.isNullOrEmpty(_incomeController.value) ||
        Validator.isNullOrEmpty(_expenseController.value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: DKAppBar(
        title: Strings.screen_title,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DKStepper(
              steps: STEPS,
              currentStep: 1,
            ),
            SizedBox(
              height: 48,
            ),
            Text(
              Strings.personalInfoHeading,
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
              Strings.personalInfoDesc,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            DropDown(
              items: ['Goal1', 'Goal2', 'Goal3', 'Goal4'],
              hintText: Strings.goal_hint,
              controller: _goalController,
            ),
            SizedBox(
              height: 30,
            ),
            DropDown(
              items: ['100000', '200000', '300000'],
              hintText: Strings.income_hint,
              controller: _incomeController,
            ),
            SizedBox(
              height: 30,
            ),
            DropDown(
              items: ['50000', '35000', '12345', '65743'],
              hintText: Strings.expense_hint,
              controller: _expenseController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DKButton(
            text: Strings.btn_next,
            onClick: () {
              print('Goal: ${_goalController.value}');
              print('Income: ${_incomeController.value}');
              print('Expense: ${_expenseController.value}');
              Navigator.of(context).pushNamed(ScheduleScreen.routeName);
            }),
      ),
    );
  }
}
