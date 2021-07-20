import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import 'details.dart';

class DetailsPage extends StatefulWidget {
  final DetaislController controller;
  const DetailsPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final city = ModalRoute.of(context)?.settings.arguments as CityEntity;
    widget.controller.getForecasts(city);
    return Scaffold(
      appBar: AppBar(
        title: Text('Forecast'),
      ),
      body: ValueListenableBuilder<bool>(
        builder: (BuildContext context, value, Widget? child) {
          if (value) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              shrinkWrap: true,
              itemCount: widget.controller.forecasts.value.length,
              itemBuilder: (_, index) {
                final forecast = widget.controller.forecasts.value[index];
                return ListTile(
                  leading: Image.network(
                    'http://openweathermap.org/img/w/${forecast.icon}.png',
                  ),
                  title: Text(forecast.temp.toString()),
                  trailing: Text('${forecast.date.day}/${forecast.date.month}'),
                  subtitle: Text(
                      'Max: ${forecast.maxTemp}, Min: ${forecast.minTemp}\n${forecast.description}'),
                );
              });
        },
        valueListenable: widget.controller.load,
      ),
    );
  }
}
