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
}
