import 'package:building_beautiful_app_with_flutter/src/slides.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/body_widget.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/flutter.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/font_size_widget.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/keyboard_listener_widget.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/tap_for_next_slide_widget.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/slide_padding_widget.dart';
import 'package:building_beautiful_app_with_flutter/src/widget/title_widget.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class SlideWidget extends StatelessWidget {
  final int id;
  final Slide contents;

  const SlideWidget(this.id, this.contents, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SlideIdInheritedWidget(
      id,
      FontSizeWidget(
        KeyboardListenerWidget(
          contents.build(context),
        ),
      ),
    );
  }
}

abstract class Slide {
  const Slide._();

  const factory Slide.custom(
    String title,
    SlideBodyBuilder bodyBuilder,
  ) = _SlideCustom;

  const factory Slide.text(String title, String body) = _SlideText;

  const factory Slide.twoColumn(
    String title,
    SlideBodyBuilder leftBuilder,
    String right,
  ) = _SlideTwoColumn;

  Widget build(BuildContext context);

  static int id(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_SlideIdInheritedWidget>().id;

  static Future<void> previous(BuildContext context) async {
    final slideId = id(context);
    final previousId = slideId > 0 ? slideId - 1 : null;
    if (previousId == null) return;

    return Navigator.of(context).pushReplacementNamed(
      'slide$previousId',
      arguments: {'direction': 'previous'},
    );
  }

  static Future<void> next(BuildContext context) async {
    final slideId = id(context);
    final nextId = slideId < slides.length - 1 ? slideId + 1 : null;
    if (nextId == null) return;

    return Navigator.of(context).pushReplacementNamed(
      'slide$nextId',
      arguments: {'direction': 'next'},
    );
  }
}

class _SlideCustom extends Slide {
  final String title;
  final SlideBodyBuilder bodyBuilder;

  const _SlideCustom(this.title, this.bodyBuilder) : super._();

  Widget build(BuildContext context) {
    return SlidePaddingWidget(
      [
        TitleWidget(title),
        bodyBuilder(),
      ],
    );
  }
}

class _SlideText extends Slide {
  final String title;
  final String body;

  const _SlideText(this.title, this.body) : super._();

  Widget build(BuildContext _) {
    return SlidePaddingWidget(
      [
        TitleWidget(title),
        Expanded(
          child: BodyWidget(
            HtmlWidget(body),
          ),
        ),
      ],
    );
  }
}

class _SlideTwoColumn extends Slide {
  final String title;
  final SlideBodyBuilder leftBuilder;
  final String right;

  const _SlideTwoColumn(
    this.title,
    this.leftBuilder,
    this.right,
  ) : super._();

  Widget build(BuildContext context) {
    return SlidePaddingWidget(
      [
        TitleWidget(title),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: leftBuilder()),
              Expanded(
                child: BodyWidget(
                  HtmlWidget(right),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SlideIdInheritedWidget extends InheritedWidget {
  final int id;

  _SlideIdInheritedWidget(this.id, Widget child, {Key key})
      : super(child: child, key: key);

  @override
  bool updateShouldNotify(_SlideIdInheritedWidget oldWidget) =>
      oldWidget.id != id;
}
