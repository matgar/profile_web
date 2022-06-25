import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      tooltip: AppLocalizations.of(context)!.repositoryActionTooltip,
      icon: const Icon(Icons.code),
    );
  }
}
