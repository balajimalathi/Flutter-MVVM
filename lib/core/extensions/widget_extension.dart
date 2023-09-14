import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget get toSliver {
    return SliverToBoxAdapter(
      child: this,
    );
  }

  Widget pt(double nn) => Padding(
        padding: EdgeInsets.only(top: nn),
        child: this,
      );

  Widget pb(double nn) => Padding(
        padding: EdgeInsets.only(bottom: nn),
        child: this,
      );

  Widget pl(double nn) => Padding(
    padding: EdgeInsets.only(left: nn),
    child: this,
  );

  Widget pr(double nn) => Padding(
    padding: EdgeInsets.only(right: nn),
    child: this,
  );

  Widget phv(double nn, double mm) => Padding(
    padding: EdgeInsets.symmetric(horizontal: nn, vertical: mm),
    child: this,
  );

  Widget pa(double nn) => Padding(
    padding: EdgeInsets.all(nn),
    child: this,
  );
}
