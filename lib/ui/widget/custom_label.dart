import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String titleText, descriptionText;
  final Color color;
  final CrossAxisAlignment alignment;
  const CustomLabel({
    super.key,
    this.color = Colors.grey,
    required this.titleText,
    required this.descriptionText,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          titleText,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: color),
        ),
        Text(
          descriptionText,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: color),
        ),
      ],
    );
  }
}
