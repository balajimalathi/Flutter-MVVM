import 'package:flutter/material.dart';

/// Created by Balaji Malathi on 22-03-2023 at 17:06.
class FieldBuilder extends StatelessWidget {
  final String label;
  final Widget child;
  const FieldBuilder({Key? key, required this.label, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        child
      ],
    );
  }
}
