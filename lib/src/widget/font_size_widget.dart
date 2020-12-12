import 'dart:math';

import 'package:flutter/material.dart';

class FontSizeWidget extends StatelessWidget {
  final Widget child;

  const FontSizeWidget(this.child, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final style = DefaultTextStyle.of(context).style;
        final shorter = min(constraints.maxHeight, constraints.maxWidth);

        return DefaultTextStyle(
          style:
              shorter.isFinite ? style.copyWith(fontSize: shorter / 30) : style,
          child: child,
        );
      },
    );
  }
}
