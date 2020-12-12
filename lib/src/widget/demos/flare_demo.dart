import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

const animations = ['Look', 'Dance', 'Stand', 'Jump', 'Wave'];

class FlareDemo extends StatefulWidget {
  @override
  State<FlareDemo> createState() => _FlareDemoState();
}

/// What will be demo:
/// 1. Column -> Expanded -> OutlinedButton(child: Text('Dance'),onPressed: () => setState(() => animation = 'Dance'),),
/// 2. Wrap -> Padding -> onPressed
class _FlareDemoState extends State<FlareDemo> {
  String animation = 'Look';

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      // https://www.2dimensions.com/a/tracygipson/files/flare/minion
      'images/minion.flr',
      alignment: Alignment.center,
      animation: animation,
      fit: BoxFit.contain,
    );
  }
}
