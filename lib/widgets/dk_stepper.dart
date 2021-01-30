import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DKStep {
  final label;

  const DKStep(
    this.label,
  );
}

const double stepSize = 48.0;
const double borderWidth = 3.0;

class DKStepper extends StatelessWidget {
  final List<DKStep> steps;
  final Color fillColor;
  final int currentStep;

  const DKStepper({
    Key key,
    @required this.steps,
    this.fillColor = Colors.green,
    this.currentStep = -1,
  })  : assert(steps != null),
        assert(currentStep != null),
        // assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  bool _isLast(int index) {
    return steps.length - 1 == index;
  }

  Widget _buildCircle(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: stepSize,
      height: stepSize,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index <= currentStep ? fillColor : Colors.white,
            border: Border.all(
              color: Colors.black,
              width: borderWidth / 2,
            )),
        child: Center(
          child: Text(steps[index].label != null ? steps[index].label : '${index + 1}', style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),),
        ),
      ),
    );
  }

  Widget _buildHorizontal() {
    final List<Widget> children = <Widget>[
      for (int i = 0; i < steps.length; i += 1) ...<Widget>[
        _buildCircle(i),
        if (!_isLast(i))
          Expanded(
            child: Container(
              height: borderWidth,
              color: Colors.black,
            ),
          ),
      ],
    ];
    return Row(
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHorizontal();
  }
}
