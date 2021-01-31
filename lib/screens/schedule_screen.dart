import 'package:dkatalis_assignment/common/constants.dart';
import 'package:dkatalis_assignment/common/strings.dart';
import 'package:dkatalis_assignment/widgets/dk_app_bar.dart';
import 'package:dkatalis_assignment/widgets/dk_button.dart';
import 'package:dkatalis_assignment/widgets/dk_stepper.dart';
import 'package:dkatalis_assignment/widgets/drop_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScheduleScreen extends StatefulWidget {
  static const routeName = '/schedule';

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> with TickerProviderStateMixin {
  final DropDownController _dateController = DropDownController();
  final DropDownController _timeController = DropDownController();
  AnimationController _animationController;

  DateTime _selectedDate = DateTime.now();
  String _selectedDay;
  String _selectedTime;

  _ScheduleScreenState() {
    _selectedDay = _getDay(_selectedDate);
    _selectedTime = _getTime(_selectedDate);
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
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
              currentStep: 2,
            ),
            Container(
              height: 100,
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Container(
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.3),
                        shape: CircleBorder(),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0 * _animationController.value),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _startAnimation();
                        _selectDate(context);
                      },
                      color: Colors.blue,
                      icon: Icon(Icons.calendar_today, size: 24),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              Strings.scheduleHeading,
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
              Strings.scheduleDesc,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 22 / 14,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            DropDown(
              items: [],
              hintText: 'Date',
              controller: _dateController,
            ),
            SizedBox(
              height: 30,
            ),
            DropDown(
              items: [],
              hintText: 'Time',
              controller: _timeController,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Selected Date: $_selectedDay',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Selected Time: $_selectedTime',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DKButton(
          text: Strings.btn_next,
          onClick: () {
            print('Time: ${_dateController.value}');
            print('Date: ${_timeController.value}');
          },
        ),
      ),
    );
  }

  _startAnimation() {
    if (_animationController == null) return;
    _animationController.forward();
    _animationController.repeat(reverse: true);
  }

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
        return buildCupertinoDatePicker(context);
      case TargetPlatform.macOS:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return;
    }
  }

  /// This builds material date picker in Android
  buildMaterialDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != _selectedDate)
      _updateDateTime(picked);
  }

  /// This builds cupertion date picker in iOS
  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != _selectedDate)
                  _updateDateTime(picked);
              },
              initialDateTime: _selectedDate,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

  _updateDateTime(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
      _selectedDay = _getDay(_selectedDate);
      _selectedTime = _getTime(_selectedDate);
    });
  }

  String _getDay(DateTime selectedDate) {
    print('_selectedDay: $_selectedDay');
    return "${selectedDate.day.toString()}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year.toString().padLeft(2, '0')}";
  }

  String _getTime(DateTime selectedDate) {
    print('_selectedTime: $_selectedDay');
    return "${selectedDate.hour.toString()}-${selectedDate.minute.toString().padLeft(2, '0')}-${selectedDate.second.toString().padLeft(2, '0')}";
  }
}
