import 'package:building_beautiful_app_with_flutter/src/slides.dart';
import 'package:building_beautiful_app_with_flutter/src/slides/slide.dart';
import 'package:flare_flutter/flare_testing.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() async {
  await loadAppFonts();
  FlareTesting.setup();

  testGoldens('Weather types should look correct', (tester) async {
    final aspectRatio = 16.0 / 9.0;
    final builder = GoldenBuilder.grid(
      columns: 4,
      widthToHeightRatio: 1.0,
    );

    for (var i = 0; i < slides.length; i++) {
      builder.addScenario(
          'slide$i',
          AspectRatio(
            aspectRatio: aspectRatio,
            child: SlideWidget(i, slides[i]),
          ));
    }

    final width = 2000.0;
    final height = ((width / builder.columns) / builder.widthToHeightRatio) *
        (builder.scenarios.length / builder.columns).ceil();

    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: Size(width, height),
    );
    await screenMatchesGolden(tester, 'slides');
  });
}
