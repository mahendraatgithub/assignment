import 'package:dkatalis_assignment/common/strings.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
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
                Strings.personalInfoHeading,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                Strings.personalInfoDesc,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              DropDown(
                items: ['Goal1', 'Goal2', 'Goal3', 'Goal4'],
                hintText: 'Goal for activation',
                controller: _goalController,
              ),
              SizedBox(
                height: 30,
              ),
              DropDown(
                items: ['100000', '200000', '300000'],
                controller: _incomeController,
              ),
              SizedBox(
                height: 30,
              ),
              DropDown(
                items: ['50000', '35000', '12345', '65743'],
                controller: _expenseController,
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
            print('Goal: ${_goalController.value}');
            print('Income: ${_incomeController.value}');
            print('Expense: ${_expenseController.value}');
          },
        ),
      ),
    );
  }
}
