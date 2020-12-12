import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleWidget extends StatelessWidget {
  final String data;

  const TitleWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fontSize = DefaultTextStyle.of(context).style.fontSize;

    return Container(
      color: theme.primaryColor,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(fontSize),
              child: Text(
                data,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: fontSize * 2,
                ),
              ),
            ),
          ),
          SvgPicture.asset('images/webuild.svg'),
        ],
      ),
    );
  }
}
