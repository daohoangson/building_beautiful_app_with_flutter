import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// class _Home extends StatelessWidget {
//   final slider = ValueNotifier(0.0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Container(
//                 color: Colors.red,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Container(
//                     color: Colors.blue,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Text(
//                         'Yolo',
//                       ).deconstructed(slider),
//                     ),
//                   ).deconstructed(slider),
//                 ),
//               ).deconstructedRoot(slider),
//             ),
//           ),
//           AnimatedBuilder(
//             animation: slider,
//             builder: (_, __) => Slider(
//               max: 10.0,
//               min: 0.0,
//               onChanged: (v) => slider.value = v,
//               value: slider.value,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class DeconstructedRootWidget extends SingleChildRenderObjectWidget {
  final double value;

  DeconstructedRootWidget({
    Widget child,
    Key key,
    @required this.value,
  }) : super(child: child, key: key);

  @override
  RenderObject createRenderObject(BuildContext _) =>
      _DeconstructedRootRenderObject(value);

  @override
  void updateRenderObject(
      BuildContext _, _DeconstructedRootRenderObject renderObject) {
    renderObject.value = value;
  }
}

class DeconstructedWidget extends SingleChildRenderObjectWidget {
  final double value;

  DeconstructedWidget({
    Widget child,
    Key key,
    @required this.value,
  }) : super(child: child, key: key);

  @override
  RenderObject createRenderObject(BuildContext _) =>
      _DeconstructedRenderObject(value);

  @override
  void updateRenderObject(
      BuildContext _, _DeconstructedRenderObject renderObject) {
    renderObject.value = value;
  }
}

extension WidgetDeconstructed on Widget {
  Widget deconstructed(ValueNotifier<double> notifier) => AnimatedBuilder(
        animation: notifier,
        builder: (_, child) => DeconstructedWidget(
          value: notifier.value,
          child: child,
        ),
        child: this,
      );

  Widget deconstructedRoot(ValueNotifier<double> notifier) => AnimatedBuilder(
        animation: notifier,
        builder: (_, child) => DeconstructedRootWidget(
          value: notifier.value,
          child: child,
        ),
        child: this,
      );
}

class _DeconstructedRenderObject extends RenderProxyBox {
  _DeconstructedRenderObject(this._value);

  double _value;
  set value(double v) {
    if (v == _value) return;
    _value = v;
    markNeedsLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    if (_value != 0.0 && child != null) {
      canvas.drawRect(
        Rect.fromLTWH(
            offset.dx, offset.dy, child.size.width, child.size.height),
        Paint()..color = Color.fromARGB(80, 0, 0, 0),
      );
    }

    canvas.save();

    canvas.translate(offset.dx, offset.dy);
    canvas.translate(25 * _value, -25 * _value);

    super.paint(context, Offset.zero);

    if (_value > 0.0) {
      canvas.drawRect(
        Rect.fromLTWH(0, 0, child.size.width, child.size.height),
        Paint()..style = PaintingStyle.stroke,
      );
    }

    canvas.restore();
  }
}

class _DeconstructedRootRenderObject extends RenderProxyBox {
  _DeconstructedRootRenderObject(this._value);

  double _value;
  set value(double v) {
    if (v == _value) return;
    _value = v;
    markNeedsLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    canvas.save();

    canvas.translate(offset.dx, offset.dy);
    canvas.skew(_value * .25, 0.0);
    canvas.scale(1.0 - _value * .25, 1.0);

    super.paint(context, Offset.zero);

    canvas.restore();
  }
}
