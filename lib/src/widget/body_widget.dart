import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  final Widget child;

  const BodyWidget(this.child, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = DefaultTextStyle.of(context).style;

    return Padding(
      padding: EdgeInsets.all(style.fontSize),
      child: DefaultTextStyle(
        style: style.copyWith(height: 1.3),
        child: child,
      ),
    );
  }
}
