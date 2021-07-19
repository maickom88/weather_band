import 'package:flutter/material.dart';

class AppDefault {
  static const double hPadding = 18;
  static const double vPadding = 22;

  static SizedBox defaultSpaceHeight({double height = 20}) =>
      SizedBox(height: height);

  static SizedBox defaultSpaceWidth({double width = 10}) =>
      SizedBox(width: width);

  static BorderRadius defaultBorderRadius({double radius = 13}) =>
      BorderRadius.circular(radius);

  static double totalHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double totalWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
}

extension AppDefaultPadding on Widget {
  Padding withAllPadding({double padding = AppDefault.vPadding}) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Padding withSymPadding({
    double hPadding = AppDefault.hPadding,
    double vPadding = AppDefault.vPadding,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        child: this,
      );

  Padding withLeftPadding({double leftPadding = AppDefault.hPadding}) =>
      Padding(padding: EdgeInsets.only(left: leftPadding), child: this);

  Padding withRightPadding({double rightPadding = AppDefault.hPadding}) =>
      Padding(padding: EdgeInsets.only(right: rightPadding), child: this);

  Padding withTopPadding({double topPadding = AppDefault.vPadding}) =>
      Padding(padding: EdgeInsets.only(top: topPadding), child: this);

  Padding withBottomPadding({double bottomPadding = AppDefault.vPadding}) =>
      Padding(padding: EdgeInsets.only(bottom: bottomPadding), child: this);
}
