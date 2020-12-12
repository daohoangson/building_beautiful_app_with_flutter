import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTileDemo(index),
      itemCount: 999999,
    );
  }
}

/// What will be demo:
/// 1. Image.asset('images/flutter.png');
/// 2. ElevatedButton(child: Text('Press me!'),);
/// 3. onPressed: () => print('pressed'),
class ListTileDemo extends StatelessWidget {
  final int index;

  const ListTileDemo(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$index'),
      onTap: () => print('onTap: $index'),
    );
  }
}
