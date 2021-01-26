import 'package:dkatalis_assignment/common/strings.dart';
import 'package:dkatalis_assignment/widgets/drop_down.dart';
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
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            AnimatedBuilder(
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
                  },
                  color: Colors.blue,
                  icon: Icon(Icons.calendar_today, size: 24),
                ),
              ),
            ),
            Text(
              Strings.scheduleHeading,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              Strings.scheduleDesc,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                height: 22 / 14,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            DropDown(
              items: ['Date1', 'Date2', 'Date3', 'Date4'],
              hintText: 'Date',
              controller: _dateController,
            ),
            SizedBox(
              height: 30,
            ),
            DropDown(
              items: ['Time1', 'Time2', 'Time3'],
              hintText: 'Time',
              controller: _timeController,
            ),
          ],
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
}
