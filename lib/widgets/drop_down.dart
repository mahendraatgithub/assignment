import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DropDownController {
  String value;
}

class DropDown extends StatefulWidget {
  final List<String> items;
  final DropDownController controller;
  final String hintText;

  const DropDown({Key key, @required this.items, this.controller, this.hintText}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState(controller, hintText: hintText);
}

class _DropDownState extends State<DropDown> {
  DropDownController controller;
  String hintText;

  _DropDownState(this.controller, {this.hintText}) {
    controller = controller ?? DropDownController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: controller.value,
        isExpanded: true,
        // TODO complete hint widget
        hint: hintText != null ? Text(hintText) : null,
        icon: Icon(Icons.keyboard_arrow_down),
        underline: SizedBox(),
        onChanged: (String item) {
          setState(() {
            controller.value = item;
          });
        },
        items: widget.items != null
            ? widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()
            : [],
      ),
    );
  }
}
