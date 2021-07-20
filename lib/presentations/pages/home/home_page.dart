import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;
  const HomePage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.homeController.getCurrentCities();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather Band',
          style: AppTypography.t18WithW800(),
        ),
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: widget.homeController.load,
        builder: (BuildContext context, value, Widget? child) {
          if (value) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20),
            itemCount: widget.homeController.forecasts.value.length,
            shrinkWrap: true,
            itemBuilder: (_, index) => ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: widget.homeController.cities[index],
                );
              },
              leading: Image.network(
                'http://openweathermap.org/img/w/${widget.homeController.forecasts.value[index].icon}.png',
              ),
              subtitle: Text(
                  'Max: ${widget.homeController.forecasts.value[index].maxTemp}, Min: ${widget.homeController.forecasts.value[index].minTemp}\n${widget.homeController.forecasts.value[index].description}'),
              title: Tooltip(
                message:
                    '${widget.homeController.cities[index].city}, ${widget.homeController.cities[index].code}',
                child: Text(
                  '${widget.homeController.cities[index].city}, ${widget.homeController.cities[index].code}',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
