import 'package:flutter/material.dart';

/// Created by Balaji Malathi on 22-03-2023 at 16:53.
class ColumnSpacing extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final EdgeInsets padding;

  const ColumnSpacing({Key? key, required this.children, this.spacing = 16, this.padding = const EdgeInsets.all(8)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      shrinkWrap: true,
      itemCount: children.length,
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: spacing);
      },
    );
  }
}
