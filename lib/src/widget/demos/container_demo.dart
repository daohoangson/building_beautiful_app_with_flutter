import 'package:flutter/material.dart';

/// What will be demo:
/// 1. padding: EdgeInsets.all(8),
/// 2. alignment: Alignment.xxx,
/// 3. decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),),
/// 4. AnimatedContainer+duration
/// 5. border: Border.all(width: 4),
/// 6. gradient: LinearGradient(colors: [Colors.yellow, Colors.orange],),
/// 7. RadialGradient
/// 8. boxShadow: [BoxShadow(blurRadius: 25),],
/// 9. BoxShadow(blurRadius: 5, color: Colors.lime),
/// 10. shape: BoxShape.circle,
/// 11. Align
/// 12. DecoratedBox
/// 13. Padding
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      margin: EdgeInsets.all(8),
      child: Container(
        color: Colors.green,
        margin: EdgeInsets.all(16),
        child: Container(
          color: Colors.blue,
          margin: EdgeInsets.all(24),
          child: Text('Foo'),
        ),
      ),
    );
  }
}
