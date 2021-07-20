import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import 'home.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController;
  const HomePage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather Band',
          style: AppTypography.t18WithW800(),
        ),
      ),
      body: ListView.builder(
        itemCount: homeController.cities.length,
        shrinkWrap: true,
        itemBuilder: (_, index) => ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: homeController.cities[index],
            );
          },
          title: Tooltip(
            message:
                '${homeController.cities[index].city}, ${homeController.cities[index].code}',
            child: Text(
              '${homeController.cities[index].city}, ${homeController.cities[index].code}',
            ),
          ),
        ),
      ).withAllPadding(),
    );
  }
}
