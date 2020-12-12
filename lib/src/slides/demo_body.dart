import 'package:building_beautiful_app_with_flutter/src/widget/body_widget.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/demos/custom_paint_demo.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/demos/flare_demo.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/flutter.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/demos/column_demo.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/demos/container_demo.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/demos/listview_demo.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/demos/row_demo.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/phone_frame.dart';

class DemoBody extends StatelessWidget {
  final Widget demo;

  const DemoBody(this.demo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      Center(
        child: PhoneFrame(
          demo,
        ),
      ),
    );
  }

  static Widget column() => Expanded(child: DemoBody(ColumnDemo()));

  static Widget container() => Expanded(child: DemoBody(ContainerDemo()));

  static Widget customPaint() => Expanded(child: DemoBody(CustomPaintDemo()));

  static Widget flare() => Expanded(child: DemoBody(FlareDemo()));

  static Widget listView() => Expanded(child: DemoBody(ListViewDemo()));

  static Widget row() => Expanded(child: DemoBody(RowDemo()));
}
