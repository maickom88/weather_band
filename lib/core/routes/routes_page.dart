import 'package:flutter/material.dart';

import '../../factories/factories.dart';
import '../../presentations/pages/details/details.dart';
import '../../presentations/pages/home/home.dart';
import '../constants/constants.dart';

class Routers {
  static Map<String, Widget Function(BuildContext)> pages = {
    RoutesConsts.home: (context) =>
        HomePage(homeController: buildHomeController()),
    RoutesConsts.details: (context) => DetailsPage(
          controller: buildDetaislController(),
        ),
  };
}
