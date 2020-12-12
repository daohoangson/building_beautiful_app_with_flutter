import 'package:flutter/material.dart';

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fontSize = DefaultTextStyle.of(context).style.fontSize;
    return Container(
      color: Colors.blue,
      height: fontSize * 3,
      margin: EdgeInsets.all(fontSize),
      width: fontSize * 3,
    );
  }
}

class GreenBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fontSize = DefaultTextStyle.of(context).style.fontSize;
    return Container(
      color: Colors.green,
      height: fontSize * 3,
      margin: EdgeInsets.all(fontSize),
      width: fontSize * 3,
    );
  }
}

class RedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fontSize = DefaultTextStyle.of(context).style.fontSize;
    return Container(
      color: Colors.red,
      height: fontSize * 3,
      margin: EdgeInsets.all(fontSize),
      width: fontSize * 3,
    );
  }
}
