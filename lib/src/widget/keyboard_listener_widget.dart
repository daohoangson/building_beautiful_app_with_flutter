import 'package:building_beautiful_app_with_flutter/src/slides/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardListenerWidget extends StatefulWidget {
  final Widget child;

  const KeyboardListenerWidget(this.child, {Key key}) : super(key: key);

  @override
  State<KeyboardListenerWidget> createState() => _KeyboardListenerState();
}

class _KeyboardListenerState extends State<KeyboardListenerWidget> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: focusNode,
      onKey: (e) {
        if (e is! RawKeyUpEvent) return;

        final key = e.physicalKey;
        if (key == PhysicalKeyboardKey.space ||
            key == PhysicalKeyboardKey.arrowRight ||
            key == PhysicalKeyboardKey.arrowDown) {
          Slide.next(context);
          return;
        }

        if (key == PhysicalKeyboardKey.arrowLeft ||
            key == PhysicalKeyboardKey.arrowUp) {
          Slide.previous(context);
          return;
        }
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
