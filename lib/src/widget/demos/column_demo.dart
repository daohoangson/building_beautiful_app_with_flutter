import 'package:building_beautiful_app_with_flutter/src/widget/building_blocks.dart';
import 'package:flutter/material.dart';

/// What will be demo:
/// crossAxisAlignment: CrossAxisAlignment.stretch,
/// Expanded(child: GreenBox(),),
/// Expanded(child: RedBox(),flex: 2,),
class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RedBox(),
        GreenBox(),
        BlueBox(),
      ],
    );
  }
}
