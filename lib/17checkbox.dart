import 'package:flutter/material.dart';

class CheckBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox"),
      ),
      body: Content(),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [SwitchAndCheckBoxWidget()],
      ),
    );
  }
}

class SwitchAndCheckBoxWidget extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxWidget> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected, //当前状态
          onChanged: (value) {
            setState(() => _switchSelected = value);
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged: (value) {
            setState(() => _checkboxSelected = value!);
          },
        )
      ],
    );
  }
}
