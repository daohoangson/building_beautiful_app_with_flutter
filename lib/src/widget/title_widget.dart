import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String data;

  const TitleWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = DefaultTextStyle.of(context).style;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        data,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style?.copyWith(
          color: theme.accentColor,
          fontSize: style.fontSize * 2,
        ),
      ),
    );
  }
}
