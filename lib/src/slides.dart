import 'package:building_beautiful_app_with_flutter/src/widget/counter_app_demo.dart';

import 'slides/google_trends_rn_body.dart';
import 'slides/demo_body.dart';
import 'slides/showcase_body.dart';
import 'slides/slide.dart';

const slides = <Slide>[
  Slide.text(
    'Bulding a beautiful app with Flutter',
    """
<ol>
  <li>Introduction: What is Flutter?</li>
  <li>Everything is a widget</li>
  <li>Layout widgets: Column, Row, ListView</li>
  <li>Effects: decoration, gradient</li>
  <li>Drawing with CustomPaint</li>
  <li>Animations</li>
</ol>
    """,
  ),
  Slide.text(
    'What is Flutter?',
    '''
<ul>
  <li>SDK to build cross-platform app, by Google</li>
  <li>
    Supports:
    <ul>
      <li>Stable: Android, iOS and <a href="https://fuchsia.dev">Fuchsia</a></li>
      <li>Beta: web</li>
      <li>Alpha: Linux, Windows and macOS</li>
    </ul>
  </li>
  <li>
    Pros:
    <ul>
      <li>Write once, run everwhere (finally?)</li>
      <li>
        Skia rendering engine:
        UI consistency,<!-- no OEM component, same UI across all platforms, new versions. No appcompat, unexpected behaviors -->
        GPU accelerated<!-- OpenGL, Metal or DirectX -> 60fps -->
      </li>
      <li>
        <a href="https://dart.dev">Dart</a>:
        strongly typed, NNBD (beta),<!-- improve quality control, avoid bugs -->
        hot reload<!-- improve productivity -->
      </li>
    </ul>
  </li>
  <li>
    Cons
    <!-- different scrolling physics, dialog vs bottom sheet, tabbar top vs. buttom, small details (shadow, round corners, appbar text alignment) -->
    <!-- new language, no code push as with ReactNative -->
  </li>
</ul>
    ''',
  ),
  Slide.custom(
    'Google Trends',
    GoogleTrendsRnBody.builder,
  ),
  Slide.custom(
    'Flutter apps',
    ShowcaseBody.builder,
  ),
  Slide.twoColumn(
    'Everything is a widget',
    CounterAppDemo.builder,
    '''
<br />
<br />
<ul>
  <li>The whole app</li>
  <li>Each page / screen</li>
  <li>A popup dialog</li>
  <li>A piece of text</li>
  <li>Some button</li>
  <li>etc.</li>
</ul>

Build your own widget as a composition of widgets.<!-- not extending existing View/UIView -->

<ul>
  <li>StatelessWidget</li>
  <li>StatefulWidget</li>
</ul>
    ''',
  ),
  Slide.text(
    'Comparisons',
    '''
<table border="1" cellpadding="5">
  <tr>
    <td>&nbsp;</td>
    <th>Android</th>
    <th>Flutter</th>
    <th>iOS</th>
  </tr>
  <tr>
    <th>Layouting</th>
    <td>XML with Layout Editor</td>
    <td>Widget tree via code</td>
    <td>Interface Builder / Storyboard</td>
  </tr>
  <tr>
    <th>Handling gestures</th>
    <td>View.setOnXxxListener()</td>
    <td>GestureDetector widget</td>
    <td>UIView.addGestureRecognizer()</td>
  </tr>
  <tr>
    <th>Custom drawing</th>
    <td>View.onDraw()</td>
    <td>CustomPaint widget</td>
    <td>UIView.draw()</td>
  </tr>
  <tr>
    <th>Animating</th>
    <td>XxxAnimator classes</td>
    <td>AnimatedXxx widgets</td>
    <td>UIView.animate(withDuration:animations:)</td>
  </tr>
</table>
    ''',
  ),
  Slide.custom(
    'Layout widgets: Column',
    DemoBody.column,
  ),
  Slide.custom(
    'Layout widgets: Row',
    DemoBody.row,
  ),
  Slide.custom(
    'Layout widgets: ListView',
    DemoBody.listView,
  ),
  Slide.custom(
    'Container widget',
    DemoBody.container,
  ),
  Slide.custom(
    'CustomPaint widget',
    DemoBody.customPaint,
  ),
  Slide.custom(
    'Animation with Lottie / Flare',
    DemoBody.flare,
  ),
  Slide.text(
    'The End',
    '''
<ol>
  <li>Cross-platform SDK</li>
  <li>Good performance, high productivity</li>
  <li>Everything is a widget</li>
</ol>
<br />
<br />
Questions?
  ''',
  ),
];
