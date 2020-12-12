import 'package:flutter/material.dart';

class SlidePaddingWidget extends StatelessWidget {
  final List<Widget> children;

  const SlidePaddingWidget(this.children, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext _) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      );
}
