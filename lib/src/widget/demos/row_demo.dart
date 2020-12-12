import 'package:building_beautiful_app_with_flutter/src/widget/building_blocks.dart';
import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RedBox(),
        GreenBox(),
        BlueBox(),
      ],
    );
  }
}
