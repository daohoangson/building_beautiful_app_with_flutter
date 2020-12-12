import 'package:building_beautiful_app_with_flutter/src/widget/phone_frame.dart';
import 'package:flutter/material.dart';

import 'deconstructed_widget.dart';

final notifier = ValueNotifier(0.0);

class CounterAppDemo extends StatefulWidget {
  @override
  State<CounterAppDemo> createState() => _CounterAppDemoState();

  static Widget builder() => Column(
        children: [
          Expanded(
            child: PhoneFrame(
              CounterAppDemo(),
            ).deconstructedRoot(notifier),
          ),
          AnimatedBuilder(
            animation: notifier,
            builder: (_, __) => Slider(
              value: notifier.value,
              onChanged: (v) => notifier.value = v,
            ),
          ),
        ],
      );
}

class _CounterAppDemoState extends State<CounterAppDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = DefaultTextStyle.of(context).style;
    final fontSize = style.fontSize;
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          color: theme.primaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: fontSize * .5,
              vertical: fontSize * .75,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'Flutter Demo Home Page',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: theme.colorScheme.onPrimary),
              ).deconstructed(notifier),
            ),
          ),
        ).deconstructed(notifier),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'You have pushed the button this many times:',
                      textAlign: TextAlign.center,
                    ).deconstructed(notifier),
                  ),
                  Text(
                    '$_counter',
                    style: TextStyle(fontSize: fontSize * 2),
                  ).deconstructed(notifier),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: _incrementCounter,
          child: Padding(
            padding: EdgeInsets.all(fontSize),
            child: Container(
              decoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(fontSize * .5),
              child: SizedBox(
                height: fontSize * 2,
                width: fontSize * 2,
                child: Icon(
                  Icons.add,
                  color: theme.colorScheme.onPrimary,
                  size: fontSize * 1.5,
                ),
              ),
            ).deconstructed(notifier),
          ),
        ),
      ],
    );
  }
}
