import 'package:flutter/material.dart';

class DropDownItem {
  String id;
  String label;
  dynamic extraData;

  DropDownItem(this.id, this.label, {this.extraData});

  bool operator ==(dynamic other) => other != null && other is DropDownItem && this.id == other.id;

  @override
  int get hashCode => super.hashCode;
}

class CshDropDown extends StatefulWidget {
  final String labelText;
  final bool enabled;
  final List<DropDownItem> items;
  final DropDownItem selectedItem;
  final Function onChanged;
  final FocusNode focusNode;

  CshDropDown({
    Key key,
    this.labelText,
    this.enabled = true,
    @required this.items,
    this.onChanged,
    this.selectedItem,
    this.focusNode,
  }) : super(key: key);

  @override
  _CshDropDownState createState() => _CshDropDownState(selectedItem);
}

class _CshDropDownState extends State<CshDropDown> {
  DropDownItem _currentSelectedValue;

  _CshDropDownState(DropDownItem selectedItem) {
    _currentSelectedValue = selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return FormField<DropDownItem>(
      enabled: widget.enabled,
      builder: (FormFieldState<DropDownItem> state) {
        return DropdownButtonFormField(
          isExpanded: true,
          value: _currentSelectedValue,
          focusNode: widget.focusNode,
          // icon: withRotation(
          //   direction: CshDirection.BOTTOM,
          //   child: CshIcon(padding: EdgeInsets.zero, iconUrl: 'assets/images/icons/arrow.png'),
          // ),
          decoration: InputDecoration(
            isDense: true,
            labelText: widget.labelText,
            labelStyle: theme.textTheme.subtitle2,
            contentPadding: EdgeInsets.fromLTRB(0, 9, 8, 8),
            enabledBorder: UnderlineInputBorder(
              // borderSide: BorderSide(color: customTheme.borderColor),
            ),
          ),
          items: (widget.items ?? []).map((DropDownItem item) {
            return DropdownMenuItem<DropDownItem>(
              value: item,
              child: Text(
                item.label,
                overflow: TextOverflow.ellipsis,
                // style: _currentSelectedValue?.id == item?.id
                //     ? customTheme.textTheme.subtitle3
                //     : customTheme.textTheme.textBody3,
              ),
            );
          }).toList(),
          onChanged: (DropDownItem newValue) {
            setState(() {
              _currentSelectedValue = newValue;
              state.didChange(newValue);

              if (widget.onChanged != null) {
                widget.onChanged(newValue);
              }
            });
          },
        );
      },
    );
  }
}
