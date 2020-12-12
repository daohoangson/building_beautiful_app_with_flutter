import 'package:building_beautiful_app_with_flutter/src/widget/flutter.dart';

class ShowcaseBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading('In the world'),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: _buildImage(
                  'images/ebay_motors.jpg',
                  'eBay Motors',
                ),
              ),
              Expanded(
                child: _buildImage(
                  'images/google_pay.png',
                  'Google Pay',
                ),
              ),
            ],
          ),
        ),
        _buildHeading('Việt Nam'),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: _buildImage(
                  'images/be.jpg',
                  'beGroup',
                ),
              ),
              Expanded(
                child: _buildImage(
                  'images/sendo.jpg',
                  'Sendo',
                ),
              ),
              Expanded(
                child: _buildImage(
                  'images/vinshop.jpg',
                  'Vinshop',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeading(String data) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(data),
      );

  Widget _buildImage(String name, String title) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(name),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
      ],
    );
  }

  static Widget builder() => Expanded(child: ShowcaseBody());
}
