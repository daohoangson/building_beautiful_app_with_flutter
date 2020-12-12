import 'package:covid19/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

import 'src/slides/slide.dart';
import 'src/slides.dart';
import 'src/widget/slide_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final covid19App = AppState();

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider.value(value: covid19App),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          final page = Scaffold(
            body: _buildSlideWidget(settings.name),
          );
          if (settings.arguments != null) {
            final arguments = settings.arguments as Map;
            if (arguments['direction'] == 'previous')
              return SlideRoute.previous(page);
          }

          return SlideRoute.next(page);
        },
      ),
    );
  }

  SlideWidget _buildSlideWidget(String name) {
    if (name?.startsWith('slide') == true) {
      final slideId = int.parse(name.replaceFirst(RegExp(r'^slide'), ''));
      return SlideWidget(slideId, slides[slideId]);
    }

    return SlideWidget(0, slides[0]);
  }
}
