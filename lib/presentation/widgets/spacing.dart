import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double? size;

  factory Spacing.extraSmall() {
    return const Spacing._(size: 8);
  }

  factory Spacing.small() {
    return const Spacing._(size: 16);
  }

  factory Spacing.normal() {
    return const Spacing._(size: 24);
  }

  const Spacing._({
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
    );
  }
}
