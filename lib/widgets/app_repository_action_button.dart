import 'package:flutter/material.dart';
import 'package:profile_web/core/strings.dart';

class AppRepositoryActionButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppRepositoryActionButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: Strings.repositoryActionTooltip,
      icon: const Icon(Icons.code),
    );
  }
}
