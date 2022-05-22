import 'package:flutter/material.dart';

class OutlinedPanel extends StatelessWidget {
  final Widget? child;

  const OutlinedPanel({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
