import 'package:flutter/material.dart';

class ContentButton extends StatelessWidget {
  final Widget icon;
  final Widget label;
  final VoidCallback? onPressed;
  const ContentButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Ink(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: colorScheme.onSecondary,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: IconTheme(
            data: IconThemeData(
              color: colorScheme.secondary,
              size: 18,
            ),
            child: icon,
          ),
        ),
      ),
      label: label,
      style: ElevatedButton.styleFrom(
        primary: colorScheme.secondary,
        onSurface: colorScheme.secondaryContainer,
        onPrimary: colorScheme.onSecondary,
        minimumSize: const Size(88, 44),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45.0),
        ),
      ),
    );
  }
}
