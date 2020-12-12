import 'package:building_beautiful_app_with_flutter/src/widget/font_size_widget.dart';
import 'package:flutter/material.dart';

class PhoneFrame extends StatelessWidget {
  final Widget child;

  const PhoneFrame(this.child, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: FontSizeWidget(
            child,
          ),
        ),
      ),
    );
  }
}
